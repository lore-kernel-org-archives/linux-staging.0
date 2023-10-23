Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07536FAA
	for <linux-staging@lists.linux.dev>; Mon, 23 Oct 2023 06:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="breZhHp7"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9bf0bee9f2fso100748466b.1
        for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 23:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698043206; x=1698648006; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rEMPoaqrAr584bmhMHYdUsDhpy12wr+01QsM/BCHbCI=;
        b=breZhHp7dWODEEY0NoTmW4mu2lOS//a3bSeHv3IpPA2+yaImoiVO6zkum9cbTsB0Ux
         uaY+zlYNEPxaDUI4KY9et59AKDeQp85ZhIauEQy+fLibYkFD7Wgc5IBrG+BIx5krbQr6
         BbTQYlTCcAbXs5RDnZPQrWkg5lpWqxNkhzMKHn5Rl1VZtaCHXOiLzC+6bj2AKoG6FsS+
         jkIMIHPzxR6XOdcWgPNfRI+TFtY6sGcYS9evstOkqHDxgQJOMo+S46vSgBjw/ktIQTuP
         WMo5YCR2aUaeHSDRV3qqDaFccoLZSMe+EaHb8j/pjZT5ykw8ns80Tw56VNyRpyxJz8Pd
         Ff2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698043206; x=1698648006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEMPoaqrAr584bmhMHYdUsDhpy12wr+01QsM/BCHbCI=;
        b=MriBHHAIhA5kPuy33JSKio85UT/DFp157F8FQvVubdRW2V3YPck7VLkgS5jIhV99wZ
         a6k7hQBqI1GhYZIpvyzWsunJd32J+1IlsgdT5ikOGVWXvbR+Yly8RJxNC7Im/2tnLq6B
         rpoehmvIo4qvNL+cwGiRCCimfjuC896werfk4MzE8V8eteh9WawakeamOsdzYAvy7tYX
         d6N9F1q8gHK1h76bybG4lJ27JajUFZ3DZxJAIRqfftYJVPzzH8vQHKqNwgVkGg0u+mMv
         R560KkPt3SEAA9U9hfWVuna7kqgLVGvGk+QsHz0LdOlq4MSmZaU48ZZEDwRroB3ZwpJe
         j6Lw==
X-Gm-Message-State: AOJu0Yx0pYMYr3CVxNdY7JQbbIMvpDlmLH8TH8CKt0OuMCEZete79flY
	1XzQcFt8tb4sMQwFqdotZJtYNogm/6g=
X-Google-Smtp-Source: AGHT+IEJEXXXpjEX50Iazdue/9QtEDeAgzztPJ8RGywLw8vA7t4HM4MMUXDezIS/uFkV8zbGBQnpPA==
X-Received: by 2002:a17:906:14da:b0:9c9:f8a3:621f with SMTP id y26-20020a17090614da00b009c9f8a3621fmr1549799ejc.6.1698043205996;
        Sun, 22 Oct 2023 23:40:05 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id v18-20020a1709063bd200b009737b8d47b6sm6026532ejf.203.2023.10.22.23.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 23:40:05 -0700 (PDT)
Date: Mon, 23 Oct 2023 08:40:04 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] staging: rtl8192e: Remove unused variables from union
 tspec_body
Message-ID: <ffeb86f15454ec17d7fc2ce66151393b6757d0a7.1698042685.git.philipp.g.hortmann@gmail.com>
References: <cover.1698042685.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1698042685.git.philipp.g.hortmann@gmail.com>

Remove unused variables to shorten code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_Qos.h | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_Qos.h b/drivers/staging/rtl8192e/rtl819x_Qos.h
index 7f086b7a1b88..ac321952f7b3 100644
--- a/drivers/staging/rtl8192e/rtl819x_Qos.h
+++ b/drivers/staging/rtl8192e/rtl819x_Qos.h
@@ -15,25 +15,8 @@ union qos_tsinfo {
 };
 
 union tspec_body {
-	u8		charData[55];
-
 	struct {
 		union qos_tsinfo ts_info;
-		u16	NominalMSDUsize;
-		u16	MaxMSDUsize;
-		u32	MinServiceItv;
-		u32	MaxServiceItv;
-		u32	InactivityItv;
-		u32	SuspenItv;
-		u32	ServiceStartTime;
-		u32	MinDataRate;
-		u32	MeanDataRate;
-		u32	PeakDataRate;
-		u32	MaxBurstSize;
-		u32	DelayBound;
-		u32	MinPhyRate;
-		u16	SurplusBandwidthAllowance;
-		u16	MediumTime;
 	} f;
 };
 
-- 
2.42.0

