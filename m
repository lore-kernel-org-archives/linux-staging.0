Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C7B3FEC
	for <linux-staging@lists.linux.dev>; Mon, 14 Mar 2022 19:31:10 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id dr20so35616136ejc.6
        for <linux-staging@lists.linux.dev>; Mon, 14 Mar 2022 12:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=D6Lk3jnpYTqv/HWX6yrqb55oTaEViGuZiXEI3RUj6V4=;
        b=p0wpgAkiyJexVIo0wuOxwo1bS9TuqVC6uRlgs/2FMOHV4tqsRyxR91Y1/I/rluNSDQ
         HbVGqQnkMDMusD+D3ld2bL1b6eXRzog5oSEkDaMHetBxlsNmMDPPSscmyQwS8CSZVOQs
         MNMnbk3sVW0NmAUcUDD7jevUnBlIEVmMuyse0CGpuXKplTST+WLbixAaK1GXgWL4izPw
         iBuZ0Ws0/FWDlm1InkRWqv1olHlV2jvYh5DQVJoT4pTRzq6FqxN2I0gVPx0Fw811pwch
         vnPSWFHyIKztE8DroNe5yX2cucDbv1fXkkORskPzrnS0u+ErdTfmw7SYJGnYU6CMLDmy
         YyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=D6Lk3jnpYTqv/HWX6yrqb55oTaEViGuZiXEI3RUj6V4=;
        b=CyEdVwUIZjFLUsc5d8AMu7o47mgtEh9vtSgra7YIQTO3z7Ema0l8czqJn5KGn6FgKp
         WdumDet/hJwp5CdbX2AM+cHJ8SV6iC7JqJ3f54f5el8ox+OQv9Z6FPne27nKreCAmHhI
         AnN5+xmcKgRfa7dlPimKd2hHwxZ5GSea6qhE49kDar6tBgoYXidH/jUlGIY18Fs3XaQ4
         4dO/zK4P9q52Dzwtn++hSOfZLfGWWYm7WTCqUjDeadS9PzoU7WY0I7vN7Mlc7X+1zOzw
         C4N8x83ceJRBN6tqnm+0YEMDYVpEMGXquaGbDVVJYV1ybXkhFmH4uIn3icwdLJHol9SB
         ZXuw==
X-Gm-Message-State: AOAM533MQejT+sNgM7tshUxIPr6wXtpfX4E682r+KVsofsDvskvI0fdX
	pEX94FAYp+YaapQmi2EZ6UE=
X-Google-Smtp-Source: ABdhPJyU7dNnqsEihK3XmO+jJXMko6Cv76F6Nj/P4DToErH4ibNdWbrTXH3+d5/c2okPf8pPsBRz3Q==
X-Received: by 2002:a17:907:e8b:b0:6db:7536:d84a with SMTP id ho11-20020a1709070e8b00b006db7536d84amr20194374ejc.464.1647286268405;
        Mon, 14 Mar 2022 12:31:08 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935aa6.dip0.t-ipconnect.de. [87.147.90.166])
        by smtp.gmail.com with ESMTPSA id y6-20020a056402358600b004166413d27bsm8696848edc.97.2022.03.14.12.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 12:31:08 -0700 (PDT)
Date: Mon, 14 Mar 2022 20:31:05 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: vt6656: Removed unused variable bb_vga_0
Message-ID: <09f65cf4839b089ad38f28ff691d5146e6095e58.1647284830.git.philipp.g.hortmann@gmail.com>
References: <cover.1647284830.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1647284830.git.philipp.g.hortmann@gmail.com>

Missing part of staging: vt6656: Remove unused rf_type in card.c
Reported-by: kernel test robot <lkp@intel.com>

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6656/card.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vt6656/card.c b/drivers/staging/vt6656/card.c
index d74165d0d3bb..7827e579ef3d 100644
--- a/drivers/staging/vt6656/card.c
+++ b/drivers/staging/vt6656/card.c
@@ -438,7 +438,6 @@ int vnt_set_bss_mode(struct vnt_private *priv)
 	int ret;
 	unsigned char type = priv->bb_type;
 	unsigned char data = 0;
-	unsigned char bb_vga_0 = 0x1c;
 	unsigned char bb_vga_2_3 = 0x00;
 
 	ret = vnt_mac_set_bb_type(priv, type);
@@ -449,7 +448,6 @@ int vnt_set_bss_mode(struct vnt_private *priv)
 
 	if (priv->bb_type == BB_TYPE_11A) {
 		data = 0x03;
-		bb_vga_0 = 0x20;
 		bb_vga_2_3 = 0x10;
 	} else if (priv->bb_type == BB_TYPE_11B) {
 		data = 0x02;
-- 
2.25.1

