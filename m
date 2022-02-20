Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780B35EAE
	for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 17:32:09 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id u20so14533192lff.2
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 09:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h4NNgPeseVQ7zc/okpigZG8JuoYTIL2ZK7mVcAwhCj0=;
        b=OcJt0nSJkSpqa3XuHEELanAYp0WYezb2ukpVkwYdIDnHKyZZ3dgi7I6lS/IVHSmHzo
         +i2OHT+8bh7ApJaxLXY3gnQbWdttnNMukXTFgUuzp8Mwcqgk9wdN//WbSsMcoLkYrjI1
         IEVDIw7ZhCm0ctl7Uy0mZF8+9j4FKLzJaXZTHdVaJcWvDqGe3WO8vG8jtM0cARxwCX11
         yaBtSPK37eji5xHnnM8JPte2b2g8HNVI60rbXpUS3hLVqZw2MQoJflGL8Gw1cV1M+t5V
         RjBxhm1iOyg82VOrgyPCA0qEw3FlICoSb/JKdjqZHr0JBRElSUXil8ivQ3N4BDF5cdE8
         Rkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h4NNgPeseVQ7zc/okpigZG8JuoYTIL2ZK7mVcAwhCj0=;
        b=DTstqKG38fIpXCEAoHwJWbjuuo/bUO4GEOZc8RivKF9Gxv+nbJ7fzR7bDcWGg1Iaxo
         XF7AtEKduwyQ69W1nJbxFSt7n655hvakaG1z6BzETv/BQFR66QLeaI0u5HIPQW4Se/Nb
         kzEbOW23kLSZi5NcMGnq/MfFeSWeifuuEihx3EnNbp76St3LHXJaiATi+GSJe1gMn20S
         bTuArYNJKTMAVEMrF9S24CS5DpZ1paUIKEhRBLPFjMX5txfLevEOkPkRC0B0EbGSSGDT
         piqM872sg0Gxz74PsUIYSCVgnYDAKt6jNfCpld452c9h0ZycdtYF305x+RCUh0TZiv78
         XolA==
X-Gm-Message-State: AOAM533Iavn+RQRADFbWkb12ioNdzGQb+2guPV3BsfVKiPe6hbAJRpyB
	Bnx2pmtwHc27+wIh1zTn8Xw=
X-Google-Smtp-Source: ABdhPJyOmQqYHemn1gtEi1nzc/l5k90gP+dC+iANF/Sg8KejEX6icQJ30KT9Gq0DvfdhTQ66d3zkGw==
X-Received: by 2002:a05:6512:11e3:b0:443:b9c4:48b8 with SMTP id p3-20020a05651211e300b00443b9c448b8mr8306370lfs.559.1645378327690;
        Sun, 20 Feb 2022 09:32:07 -0800 (PST)
Received: from localhost.localdomain (109-252-138-165.dynamic.spd-mgts.ru. [109.252.138.165])
        by smtp.gmail.com with ESMTPSA id f8sm880490ljk.97.2022.02.20.09.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 09:32:07 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/8] media: staging: tegra-vde: Bump BSEV DMA timeout
Date: Sun, 20 Feb 2022 20:29:47 +0300
Message-Id: <20220220172950.3401-6-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220220172950.3401-1-digetx@gmail.com>
References: <20220220172950.3401-1-digetx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BSEV DMA timeouts if VDE is downclocked by x10. Bump the timeout to allow
DMA to complete. We don't support freq scaling yet, this is just a minor
improvement which may become useful sometime later.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/h264.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-vde/h264.c b/drivers/staging/media/tegra-vde/h264.c
index a46c648a26c6..d8e5534e80c8 100644
--- a/drivers/staging/media/tegra-vde/h264.c
+++ b/drivers/staging/media/tegra-vde/h264.c
@@ -135,7 +135,7 @@ static int tegra_vde_wait_bsev(struct tegra_vde *vde, bool wait_dma)
 		return 0;
 
 	err = readl_relaxed_poll_timeout(vde->bsev + INTR_STATUS, value,
-					 !(value & BSE_DMA_BUSY), 1, 100);
+					 !(value & BSE_DMA_BUSY), 1, 1000);
 	if (err) {
 		dev_err(dev, "BSEV DMA timeout\n");
 		return err;
-- 
2.34.1

