Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74393A962C
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 20:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.223.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778532074; cv=none; b=Bui84iK+7Cm+HUeUvcz314KAi4WWvHpoSi7ajAPsgfRBp0u3rcz7NEv1T4Dsv1RSYBPzH9lsRpQmdYPH1K9XK4h3pN9jDm0rxgc2mIp0HJRAuOFJQMLe8oapb3zG68+MGJgAEAqKyp3lxEuHIf4SvfkYvk8jJx3mjG0H3JCdyJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778532074; c=relaxed/simple;
	bh=FXRdHHWXWAExJ9s38Z0mRo0D80CrRpHFA3+q6w7KFgE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uN16a5YZ4wIwpswm8gscib8UJb12crTfWFcbo8kf2VPPdkfTSBaApN5KEDQZd21WX37fklSdMC9ILuvIFFRIGyQViEuYnV7FDHZIDBvLzT4j1XdIiQorXUuFMCD+3zHIfZrklYy7G0tdUCHDIwVj5fP3HgfzoAnXqt8U2ebXsGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de; spf=pass smtp.mailfrom=al2klimov.de; dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b=U0fL8p3b; arc=none smtp.client-ip=162.55.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b="U0fL8p3b"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=FXRdHHWXWAEx
	J9s38Z0mRo0D80CrRpHFA3+q6w7KFgE=; h=in-reply-to:references:cc:to:
	subject:from:date; d=al2klimov.de; b=U0fL8p3bJ6YFbigCbPayl9S+GhYo4tmrN
	GoCz4mnKsjotF/T9p504EF1rHPPWbTnac9FrOZWoDBWjut7TSYw6SLop+XkjxIPyAp/lbI
	7bTtbI+Nedy8eq5UwS1drvCs98HujyItfY6bnNB1eTfHzlbPHn050o2nwPnQ+w2Ax8UfGT
	n1brvavkuI1g6azYz7kDUvBbPc4Fmp3nYXZznyG8QuvjHpLgpNIQQXTXLLM7VE7nPMWRJM
	Kk0uNTIkVCbo9lLJVn9xIJEI2+LTD8kxdeZCITSbSQ+gsPJe2kpvEQqurFIotcggh/9wS6
	2rBobnoPOXxLPnlpulPdei0RGdXeg==
Received: from [IPV6:2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5] (2a02-2455-18e9-e011-4d8a-aad2-c25c-50e5.dyn6.pyur.net [2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 7b2d9e2d (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Mon, 11 May 2026 20:40:55 +0000 (UTC)
Message-ID: <c17dd24c-2bf1-4ef8-a8d3-79014a75242f@al2klimov.de>
Date: Mon, 11 May 2026 22:10:16 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH v2] Greybus audio protocols drivers: correct sscanf() return
 value check
To: Dan Carpenter <error27@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
 Mark Greer <mgreer@animalcreek.com>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pankaj Bharadiya <pankaj.bharadiya@gmail.com>
References: <c758029d-186f-4a9f-b953-90121f43d8d8@al2klimov.de>
 <agGdJFofiZYKqqhr@stanley.mountain>
Content-Language: en-US
In-Reply-To: <agGdJFofiZYKqqhr@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

manager_sysfs_add_store() passes 6 pointers to sscanf(),
but required latter to return 7 which failed the operation.
I corrected it to 6.

Fixes: 49b9137a6002 ("staging: greybus: audio: remove redundant slot field")
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
  drivers/staging/greybus/audio_manager_sysfs.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager_sysfs.c b/drivers/staging/greybus/audio_manager_sysfs.c
index fcd518f954..ff323ca815 100644
--- a/drivers/staging/greybus/audio_manager_sysfs.c
+++ b/drivers/staging/greybus/audio_manager_sysfs.c
@@ -23,7 +23,7 @@ static ssize_t manager_sysfs_add_store(struct kobject *kobj,
  			desc.name, &desc.vid, &desc.pid, &desc.intf_id,
  			&desc.ip_devices, &desc.op_devices);

-	if (num != 7)
+	if (num != 6)
  		return -EINVAL;

  	num = gb_audio_manager_add(&desc);
-- 
2.54.0

