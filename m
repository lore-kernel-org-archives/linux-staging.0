Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688C6AD38
	for <linux-staging@lists.linux.dev>; Wed,  4 Jan 2023 15:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1672845524; bh=4WpdPESN9laCQ+0dJmH7VyKj6Z31XLjyfTH0r5nSp8Q=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=N39HXlk0W+MGAQ5rlz8fsuFhKA54WDmJbAWuLnco2QEA0v6Tab5DUGNbT7qKkXMie
	 aU5t/1sd6JcxZXgFXxZNsPiQcTneG5afojH2hApZrhdHFcpbiTA6ekoPSFYWTi3ldC
	 C06SrGMstJip6vnTTLtM15bXg1PaOh+HnTF86XsE=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Wed,  4 Jan 2023 16:18:44 +0100 (CET)
X-EA-Auth: 3o+1Ih6VxbOMPaGorsbD5/WgdCd+p/k8N8ulKnPs8eMqVrMW1/0ry1vYlZ+tKsz7zkpeAryF9JTQ4DZa68X2NjxW1nx+DONI
Date: Wed, 4 Jan 2023 20:48:38 +0530
From: Deepak R Varma <drv@mailo.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Saurabh Singh Sengar <ssengar@microsoft.com>,
	Praveen Kumar <kumarpraveen@linux.microsoft.com>,
	Deepak R Varma <drv@mailo.com>
Subject: [PATCH v2] staging: greybus: Replace zero-length array by
 DECLARE_FLEX_ARRAY() helper
Message-ID: <Y7WYzkIOqaHOxDDS@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The code currently uses C90 standard extension based zero length array
struct which is now deprecated and the new C99 standard extension of
flexible array declarations are to be used instead. Also, the macro
DECLARE_FLEX_ARRAY() allows to use single flexible array member in a
structure. Refer to these links [1], [2], and [3] for details.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://lore.kernel.org/lkml/YxKY6O2hmdwNh8r8@work
[3] https://lore.kernel.org/lkml/20210827163015.3141722-2-keescook@chromium.org/

Issue identified using Coccinelle flexible_array.cocci semantic patch.

Signed-off-by: Deepak R Varma <drv@mailo.com>
Reviewed-by: Alex Elder <elder@linaro.org>
---
Changes in v2:
   Following improvements as suggested by Alex Elder <elder@ieee.org>
      - Include third reference URL in the commit message.
      - Update 2nd reference URL
      - Include Reviewed by tag


 drivers/staging/greybus/usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/usb.c b/drivers/staging/greybus/usb.c
index 8e9d9d59a357..b7badf87a3f0 100644
--- a/drivers/staging/greybus/usb.c
+++ b/drivers/staging/greybus/usb.c
@@ -27,7 +27,7 @@ struct gb_usb_hub_control_request {
 };

 struct gb_usb_hub_control_response {
-	u8 buf[0];
+	DECLARE_FLEX_ARRAY(u8, buf);
 };

 struct gb_usb_device {
--
2.34.1



