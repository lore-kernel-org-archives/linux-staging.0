Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF5936920F
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 13:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770039169; cv=none; b=eoHsj0KsGiwLeDTKju01dX1vYXQqCQdxiE68ozAf9QnenfmxqvnE04JtY3bCSrqQ9J11i+F4N69h14dOQhtUu6lHKZ4Sp2jNy+mQuxblTGDSaeyRjBaPAZBGVn73QpSkMmnfysim8jAbLQFJqIZZXrwQZUIgau4DjPamH4BLecg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770039169; c=relaxed/simple;
	bh=7NmgE42vIEAb59f1fCl+ZzglmCZ0fN37uqmysx/Qugo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bUE3SBfS0uTtAhLKD5zIv7tCUG3IShjaOf7kys1MPKahank6ljFYQmZ1wB2y8V3qugj5dIFnCz8kf0+EUpV1RnhZq/bSEMroiuj/Cx23grzs//BWVynxShM0VWaTb9WFalsipo5A/yPQPeUF45EqJuPYWsWQvhgQGMpVOmIO74Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KU9k+KPa; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KU9k+KPa"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4805ef35864so37884775e9.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 05:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770039167; x=1770643967; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=flyWbnLkGe8ShZWh5QG8sMP2F4Ss5eue0eQtxiJgbhk=;
        b=KU9k+KPaufZBwjCUWUK6XZitHMttR16GYsK4yJmTPp/3fqG393JpBnecVqOgXAnElr
         lz91rTAdPJuVvHhLulRRqwSwSq0GdT+sjdSWBW0u3BIMPrXyuSVa8whAGVn935URQZ/+
         VxqC5vwRRCkZ2/SsB/4DqJij4g0tTr/TOU828wuIGuiIFIoo4QkHPrHw6zyWgjk/iSHT
         n5MjVT5Ju5U7mGEAX0CGW1WP0VepBRdwH1uv2f4067/vgGw0Hv65GlNfBXXju6m1+0sE
         tdtB2lsuo/H+Wyt3DUyEo6d815Ga3KpOEjhccUW7fiObeqq6f8tEI6njjpP+XZ/ym8Ec
         kDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770039167; x=1770643967;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=flyWbnLkGe8ShZWh5QG8sMP2F4Ss5eue0eQtxiJgbhk=;
        b=OzBxhL4yO0j96sJ48aYpj8lQD1619PUcRQC8fMEESck4jxtdNRPmp29FkdNPJD7pPP
         JnEeTr0RGCUbBgIGnzohCQ/qY2MerO+V2WUxNObpVMnslIN9N75TtP98PLaEwp6wqcf0
         K+b08fq6QjlBtV73/HjooG7FQe/lvDGKqQXr6EATT/RaNI9ZHFf9cLwcrPJ61cUxVs5+
         9gcKISZYLmTGMxX/PB5A2sZ6gvgTZC8L4k16EsVI1tGt5V+LrUXxlTMeplF1q2YPbKw3
         +hr8bKchLeUTms+NavhesFKq3ycxpgenMMsbkBo9hdyyCXOwy9IE/5ecpBThp/B+Osc1
         3x7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOUMpSfentCwkZEDAd7uoCqeRdzJNhqL2bJomjRWug3xdX1YOtBuAZUoGSsRhIIqIsxGgS18vz7W8ak9d3@lists.linux.dev
X-Gm-Message-State: AOJu0YwOI2nIF+XlllOuH0fZ0OM+SsC2KDPRxsypLYmX01LpImsgTU+O
	HOetFZXfPwuAy9joZPjOTfeoKqwUVS1G2k3MU6dX2nO5mU8N5G6uSTyPfJG9
X-Gm-Gg: AZuq6aIz3/T0QJNC0zqNgdCiwJT8xlD6J8mP6U5bSULD412S0UwXodc7mUY/I9LUZZw
	Gnf+FSBaCH3mkq9yM+9n/qyA2ACYdS7GpMDzYLNWHJPFzDfZdRvulk21FeXsegpAcJT3Np3Shvj
	E1jkhiby07ZVSq1E1k4JMwCVehRuTkKWqDy5OOkBhxw7AQhWUCAWXdPciUTp6LIX7lJwzzSxJmb
	G/JB5GBjsCYLrEjoDvAMUMNCPozcHFMaGFRUA1wkIXlr5tQ/s3+pVnLkFhdSqLjLOLHvdU1ldVn
	PfsK5OgpHnECPpBJdpvJWY1irCu4UTqYbt7zSZR6FH7E0tyPnupqVnC9xXFkTDImkEmc+JdQfiY
	CVwJXEzRRFNfpTjxXiSupsUKs9YGOXjvypPZEAFaUJnHMDFngHfgHT99cSTjYAQ7yKyLWh9MoC/
	x+0URG1IE=
X-Received: by 2002:a05:600c:4750:b0:471:14af:c715 with SMTP id 5b1f17b1804b1-482db447b7emr148624985e9.3.1770039166633;
        Mon, 02 Feb 2026 05:32:46 -0800 (PST)
Received: from fakie ([31.210.177.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c428basm486251495e9.12.2026.02.02.05.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 05:32:46 -0800 (PST)
Date: Mon, 2 Feb 2026 15:32:42 +0200
From: Eitan Collett <eitan.collett@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: audio_codec.c: Remove unnecessary
 parentheses in if statement
Message-ID: <aYCnemXK-f6Htojh@fakie>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adhere to Linux kernel coding style.

Reported by checkpatch:

CHECK: Unnecessary parentheses around 'w->id != snd_soc_dapm_aif_in'
CHECK: Unnecessary parentheses around 'w->id != snd_soc_dapm_aif_out'

Signed-off-by: Eitan Collett <eitan.collett@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 444c53b4e08d..44aee8268d14 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -305,7 +305,7 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
 	dev_dbg(module->dev, "%s:Module update %s sequence\n", w->name,
 		enable ? "Enable" : "Disable");
 
-	if ((w->id != snd_soc_dapm_aif_in) && (w->id != snd_soc_dapm_aif_out)) {
+	if (w->id != snd_soc_dapm_aif_in && w->id != snd_soc_dapm_aif_out) {
 		dev_dbg(codec->dev, "No action required for %s\n", w->name);
 		return 0;
 	}
-- 
2.52.0

