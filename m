Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190A1107AD
	for <linux-staging@lists.linux.dev>; Fri,  7 Jul 2023 14:31:29 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4QyFzH102gzBJBfn
	for <linux-staging@lists.linux.dev>; Fri,  7 Jul 2023 22:24:59 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1688739898; x=1691331899; bh=X19fiyEPm8XRU2mImTwANWy+s8P
	UCz2HiFt7jLiJe9w=; b=1CyucdBlct7ReADRylT+PDSxMS5nBQXrS25LkCm9kR7
	AhxLm13NrtA1u//sUDVcSBrk8I5GSu0I3LsfJrLf3dNRWPRC+49ZFoREyNacyy74
	CoB0tB6+jsKRPw/bzoMSAA+KBVCpBQUD37+NFPy0H4h+zj4/Lezf8lJ68uaw5A2t
	EZQ7gnH1nhTxa/I2QXCD1I7gAX+2ZzIYKqMG2eha+/gadd7aiy90LncSAzBZHbAw
	8WB1V7vH/k5OFmpTet3TjZvAmQhITnSDnaLweeeAPgBQC0iEnD5/1yCWWy9p3HLz
	UjvahoiaFlnGuWw4L8872ulIw6q5HXxfZim6upHHFXQ==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ud8Y8s1QZhKA for <linux-staging@lists.linux.dev>;
	Fri,  7 Jul 2023 22:24:58 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4QyFzG479HzBJBJ2;
	Fri,  7 Jul 2023 22:24:58 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 07 Jul 2023 22:24:58 +0800
From: hexingwei001@208suo.com
To: hdegoede@redhat.com, mchehab@kernel.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 colin.i.king@gmail.com, gregkh@linuxfoundation.org,
 sakari.ailus@linux.intel.com
Subject: [PATCH] soc: ti: smartreflex: void function return statements are not
 generally useful
In-Reply-To: <20230707133447.28102-1-panzhiai@cdjrlc.com>
References: <20230707133447.28102-1-panzhiai@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <d4b290f08da0c2435f3fa4676e7a5f25@208suo.com>
X-Sender: hexingwei001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

void function omap_sr_shutdown return statements are not generally 
useful,
so deleted the return in function omap_sr_shutdown().

Signed-off-by: Xingwei He <hexingwei001@208suo.com>
---
  drivers/soc/ti/smartreflex.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/ti/smartreflex.c b/drivers/soc/ti/smartreflex.c
index 62b2f1464e46..20abfb0b8f26 100644
--- a/drivers/soc/ti/smartreflex.c
+++ b/drivers/soc/ti/smartreflex.c
@@ -955,7 +955,7 @@ static void omap_sr_shutdown(struct platform_device 
*pdev)
      if (sr_info->autocomp_active)
          sr_stop_vddautocomp(sr_info);

-    return;
+
  }

  static const struct of_device_id omap_sr_match[] = {
