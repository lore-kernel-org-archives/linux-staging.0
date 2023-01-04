Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C117C
	for <linux-staging@lists.linux.dev>; Wed,  4 Jan 2023 03:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1672804662; bh=g68WjsKLgm0BGTYxv3eXQb4GtGzcoRHUdOjEJjW3wxY=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=mhmZWRg7q9RRn1gaJqCAY8aA9wv7j52nQH+wxTIS3sijktduushce/wrRS2V2pS8d
	 fDt+TJ2PCt4MRbhjE3a5XsNSTWUPxkvi7xJ/v9vhUF+pCZHEklAiE/+uKf/TNTBaZg
	 Gw5kxjUfHUQdURs8gEz0XTDKWko6/iP1MWGyfnZs=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Wed,  4 Jan 2023 04:57:42 +0100 (CET)
X-EA-Auth: X/DPdo8+pBhmvVri8YvZq0puHGhoKFIrcwsvZGLQWmFtOckUnZf5FYyOYxYO9PtuPY2gUj2VwJjiahd9mMMg+B4hq+B0mD0m
Date: Wed, 4 Jan 2023 09:27:37 +0530
From: Deepak R Varma <drv@mailo.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Saurabh Singh Sengar <ssengar@microsoft.com>,
	Praveen Kumar <kumarpraveen@linux.microsoft.com>,
	Deepak R Varma <drv@mailo.com>
Subject: [PATCH] staging: greybus: Replace zero-length array by
 DECLARE_FLEX_ARRAY() helper
Message-ID: <Y7T5MYfANf2xVsEx@qemulion>
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
structure. Refer to these links [1], [2] for details.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://lkml.kernel.org/r/YxKY6O2hmdwNh8r8@work

Issue identified using Coccinelle flexible_array.cocci semantic patch.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
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



