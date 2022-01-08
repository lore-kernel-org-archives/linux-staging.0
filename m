Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14142C9C
	for <linux-staging@lists.linux.dev>; Sat,  8 Jan 2022 00:55:55 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id r10so6460691wrc.3
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 16:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7HAlFSP/txm9kID3HVIKgkV7x7wASPTmapxOHoe9+Co=;
        b=fEk4d51O2nhhwquJacGaVq5A1HjhjBwKPQg0u893X027/cZwwzdGqPZvHSTvk8echw
         +d1dywaLKaKE12zVXVfVdqa5QvLd5dRlh4AZeRSsNxYSe3r7pvKXuNlsoBCtdhOk+yLB
         VACEnth4FZIVsAE4+DwDSCfkJ5OPSN0LPy99NIu71FiVp9tDqFzVsVoJF9jM1opzHO+z
         /ayQ8ldnW00Ls6Z2M9e2wdsQoMOEXfWjGfnxhKz4w3DgHDSDjFH5IIH45Zu9mp9FgF56
         rMamt2KGAok6SXgLU+/oCrfPYhYa3tZFbVrB8v6SBIcIsz23xtx2Bnp4lvbCiY9jhGwh
         OamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7HAlFSP/txm9kID3HVIKgkV7x7wASPTmapxOHoe9+Co=;
        b=fP9sLzC/nz3TKgEpWSFKC+md+1M39mkW67/gzK0w4xyrQKYm5/38TNttS7VcRN3SX/
         mINtmbGCttvFfruz5PMNctexXFYw4DRSuNRJ453X5U5RQ6WOCgOEPAPFWoR3546Vnr6o
         0angnviR67gpI2J7Mhe57zeURHm4rk+bQhl2vbeqqu+nNxMBuPWWroUnWDlozVPzXYmO
         a8ph9qvCO3YSI+RaAt/EJeX8ZLwFxjRBdYyJwgOAEh6Pf47ACuXH4Y9TIgZa9D04VFEP
         9v/XrwjWNjFaSqQVSN0Imn0LdJ8jiwS8lrAav6OwJDN/Ilc4P8mQxlpa0uTZUdiEbKwc
         QHmw==
X-Gm-Message-State: AOAM532Q+5V2dQJyY4Fe8FP+qLDWnRSUz53G3mHmUgMWCjDZb+jz/RmP
	gKylemgWYHoZmgz/7aLnhHR4XT54zDAvJw==
X-Google-Smtp-Source: ABdhPJzsimLrDKBSblclUMJDP+v2NN9+1/uBSZdmzz7RD7rg1cmgh5lsCywW0m6GW/nc48Tx0s3MhA==
X-Received: by 2002:a05:6000:18a:: with SMTP id p10mr6139139wrx.218.1641603354225;
        Fri, 07 Jan 2022 16:55:54 -0800 (PST)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id c18sm238853wrn.81.2022.01.07.16.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 16:55:53 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] staging: r8188eu: convert DBG_88E call in core/rtw_cmd.c
Date: Sat,  8 Jan 2022 00:55:49 +0000
Message-Id: <20220108005550.26264-5-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108005550.26264-1-phil@philpotter.co.uk>
References: <20220108005550.26264-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the DBG_88E macro call in core/rtw_cmd.c to use netdev_dbg
as its information may be useful to observers, and this gets the
driver closer to the point of being able to remove DBG_88E itself.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 8bfb01c2ebb5..712fd6e536c4 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -952,7 +952,9 @@ static void rtl8188e_sreset_xmit_status_check(struct adapter *padapter)
 
 	txdma_status = rtw_read32(padapter, REG_TXDMA_STATUS);
 	if (txdma_status != 0x00) {
-		DBG_88E("%s REG_TXDMA_STATUS:0x%08x\n", __func__, txdma_status);
+		netdev_dbg(padapter->pnetdev,
+			   "REG_TXDMA_STATUS: 0x%08x\n",
+			   txdma_status);
 		rtw_write32(padapter, REG_TXDMA_STATUS, txdma_status);
 	}
 	/* total xmit irp = 4 */
-- 
2.33.1

