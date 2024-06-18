Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC93E2139B6
	for <linux-staging@lists.linux.dev>; Tue, 18 Jun 2024 12:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718712825; cv=none; b=hbuAH6YNbcaTTMrtQL9fbxBRib+gffvr5Y9gJQyGd/2C6BSvRuU5SRRlW3kjJkfUJnmr/i04ogokJqD7XrmkaaFaXGq9W1x53G7CdfA6WIJ5KxmzDkZgcXHMpwL81G1eouGvy20jgXyuuX95Xx+BeEVzJJ58e3INbvH3ZuUh0i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718712825; c=relaxed/simple;
	bh=zCbh/D8UcUOkLf0l1/eFpQzAdUwpMyUso60BWpn1Ha0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C4GJvJ39IgVDIY76ERh2hvx2iEQy/y8pBDFlupmNiVtaoSS+AgemMOHwG0L0+Tl4FxIbAQ7neDJsHCm9teDJKSvN1n1r9N8cDsyKVlxBp8wH4zUdCYHLfC2ITwEE95yu8AzAWvfnE/xTn4FTHdtD9yp9zwaksHnXGycGo5gtyUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xl0QZCOz; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xl0QZCOz"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f64ecb1766so38596325ad.1
        for <linux-staging@lists.linux.dev>; Tue, 18 Jun 2024 05:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718712823; x=1719317623; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzWwZ0WI5POwNAjxZ7T9jl0G8U0Jzav8kEKDeMCZmzo=;
        b=Xl0QZCOzJ9Un3rZPfP5P+0QGMwGV/J3aWLix2qEfQO4VrPw2R/ejdV9FcoiXfMyXKb
         FcvhXfkHrsuQuTNQ9d3huolxQ1fTvVlj8Y97wXbhcrlTjz0CWk5Yowt/wvkh3uVCbKjj
         To4XFMo4Ll4AtUfmSEVF9EsyrY67qRZJxyTaBk+pO3c5LIFg3L5VRnExG2Bbbzhb9OET
         uCe70P/88IaFLxPgIlmg5+FVToSih3lovhNTz4sYE+78jMwNq1s/GRTBsPrgDmmtxX9M
         Ir986uzR5CDpqkq4/BGMhaE9tt8mqBFndwYCMdF9mUTte09qmaqgMG0DpMgjvJHGu+Ll
         7ySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718712823; x=1719317623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzWwZ0WI5POwNAjxZ7T9jl0G8U0Jzav8kEKDeMCZmzo=;
        b=A+waT2WS/zEYHNhEJSuyFSaroiHd5HknrMfUNCn2ZOekyHNh+te6R7i92TH7AgFtyp
         6pdT8YG1yyLzuo7vosv/rELh1GIFmqM3iqLJrQEHQSGrhT/hAK/jjZvZKMaHyoZtcmJc
         FYqnviYI9fp/0gY6Qy88POcYXeNY/4jKwhC0qCSIOrHRm4zgRp+pOH18oTSIjOATv5aa
         wxXyHZB7+hGTvkSGXwl/m3d4bqOau1JT5Wvnn7l7BdCc4vcX9jLen27GPWyFlJpuYrKg
         UwYTesjbZ90eabyHJkc5facE+ujM0lhlHEk5y9sOXSZaRKlE6vfPqlmvTczk80N4Lybl
         uDSA==
X-Forwarded-Encrypted: i=1; AJvYcCVuVU4REZlsHVkDmmvT1y7W/jsz+myG0xWxCdQqi62CoETFbW9RDExYkiZsEXnMTIXD3Zd5JeZ2gzQUI2fv3N/5u9NxeupuA2pCsBiEJw==
X-Gm-Message-State: AOJu0Yx8ughpks4cRELP87RzExXfcAdtgW66usxbMPkNZ8/BywP+PwvP
	HEfERo1Ip59mi/4NR/SD1rHIeBShl1tljCu7yyqTTn8GZKT2EE0P5BO63+Piyso=
X-Google-Smtp-Source: AGHT+IHaKclJUc4Efl6Ydywur9YtKqbT47GJJBF4XJ29G0rvH83AABeR7Un9gk3CcGItoYkKQc5fmw==
X-Received: by 2002:a17:902:eb82:b0:1f7:ff:b477 with SMTP id d9443c01a7336-1f8628063cdmr141385545ad.55.1718712823074;
        Tue, 18 Jun 2024 05:13:43 -0700 (PDT)
Received: from localhost.localdomain ([221.220.133.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5ba93sm96576865ad.3.2024.06.18.05.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 05:13:42 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: detlev.casanova@collabora.com
Cc: alchark@gmail.com,
	andy.yan@rock-chips.com,
	conor+dt@kernel.org,
	cristian.ciocaltea@collabora.com,
	devicetree@vger.kernel.org,
	didi.debian@cknow.org,
	dsimic@manjaro.org,
	gregkh@linuxfoundation.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	liujianfeng1994@gmail.com,
	mchehab@kernel.org,
	nicolas@ndufresne.ca,
	robh@kernel.org,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
Date: Tue, 18 Jun 2024 20:13:29 +0800
Message-Id: <20240618121329.79936-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4116468.VLH7GnMWUR@arisu>
References: <4116468.VLH7GnMWUR@arisu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Detlev,

On Fri, 14 Jun 2024 21:56:27 -0400, Detlev Casanova wrote:
>+		.frmsize = {
>+			.min_width = 16,
>+			.max_width =  65520,
>+			.step_width = 16,
>+			.min_height = 16,
>+			.max_height =  65520,
>+			.step_height = 16,
>+		},

I think the min/max width/height are incorrect. From rockchip's TRM V1.0
Part1 page 374, supported image size is 64x64 to 65472x65472. And my
chromium can't use rkvdec2 because min width/height are set to 16, which
will cause error at here in rkvdec2_h264_validate_sps:
>+	if (width > ctx->coded_fmt.fmt.pix_mp.width ||
>+	    height > ctx->coded_fmt.fmt.pix_mp.height)
>+		return -EINVAL;

width is 16, height is 32 while ctx->coded_fmt.fmt.pix_mp.width and
ctx->coded_fmt.fmt.pix_mp.height are both 16.

After changing them to 64 my chromium can use rkvdec2 to decode h264
videos now.

Anyway many thanks to your amazing work!

Best regards,
Jianfeng
