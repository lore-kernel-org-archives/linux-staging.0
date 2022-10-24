Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF217ED
	for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 08:49:41 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so2817248pjc.3
        for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 01:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnolCiMBjl8qX8ASTYaNnJALNGKZaQCXHfWumAnTsTM=;
        b=gm46cR8stv769f/3qrG5mY89pnjak1s16VZzjmmrodfvPJ0t1TxqRTEAzeUemmns9O
         zl49OqL3wnKxo6MhOV53Hnaq/lS0cldqq6ZxQdBjruuvkO52R4OZxw4caNmr3CXA0NAO
         uwLvJoeEtsXEvJjjeJCZ3RSf4ZW0i2GHnp38JwbWol8Ppeo9mPzeXdbFARvpOrUaCzR6
         j2cpfxE4W97id6cWrjzpIafnfIR49aaRHOFXcQXVQ0xyIRJPAAHGZ3dX46E+gTSg2uFU
         h1vyQtrt5bfWPK6NlBlPC1XIILP4TFTWH/+DaN4nxJbOt+fvEdapGmM3rSxprpdyouFy
         Z/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NnolCiMBjl8qX8ASTYaNnJALNGKZaQCXHfWumAnTsTM=;
        b=eiqUUnjlzT1U8rzKeMgaf69mMXGjNFw9umyRtWojkJOAWOqC2D2F8xrJK7B9Q8sYi2
         poiyll9sPMyb1aM8ZCBs8ls4Z8Ktgkf+cFBSpSS3D3b4bNNHJS7hfWn6+a0RqICAlaRE
         nLWmp6TiBmeK8WGzKKVuVv2/78IYDF0nh2H9pDvWXoSW4GVC6b4fpm/jpX3eSNbLj0ja
         KKbOYzhDnYBVejNboYqP0RMiOj7MVTWY1SzoQ7rGCTi1sXTEpuZahsneJuHRpLFNezUY
         ebq7YloVf3uoxExPLnDhk/iEPlKgEeQN+pUsi1mLO3OZxnHqL3of4g2JavQwKd5tKGjc
         R9jQ==
X-Gm-Message-State: ACrzQf1km9TcKvAdqtJKIqw+FepKpec+pWb9Jji1LyWyEB8UNSMcLk3t
	itJCfSxn7B/Qmn3re96b3KA=
X-Google-Smtp-Source: AMsMyM74znPayAddrI2+CSTk5wXaI+z62KCXc9qxsLsYFeyzdCfgZMKIK3SI+7qWwF4sMamU2Z/qhw==
X-Received: by 2002:a17:90b:1804:b0:213:1a9c:5ae with SMTP id lw4-20020a17090b180400b002131a9c05aemr3094555pjb.81.1666601380700;
        Mon, 24 Oct 2022 01:49:40 -0700 (PDT)
Received: from uftrace.. ([14.5.161.231])
        by smtp.gmail.com with ESMTPSA id r2-20020a63a542000000b00434e1d3b2ecsm17245124pgu.79.2022.10.24.01.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 01:49:40 -0700 (PDT)
From: Kang Minchul <tegongkang@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kang Minchul <tegongkang@gmail.com>
Subject: [PATCH v2 3/4] staging: r8188eu: remove unnecessary variable in rtl8188eu_xmit
Date: Mon, 24 Oct 2022 17:49:24 +0900
Message-Id: <20221024084925.262289-4-tegongkang@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024084925.262289-1-tegongkang@gmail.com>
References: <20221024084925.262289-1-tegongkang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return 0 directly instead of storing it in a variable.
This can prevent cocci warning as follows:

  Unneeded variable: "pull". Return "0" on line 298

Signed-off-by: Kang Minchul <tegongkang@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
index 8e4a5acc0b18..6d1f56d1f9d7 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
@@ -149,7 +149,6 @@ static void fill_txdesc_phy(struct pkt_attrib *pattrib, __le32 *pdw)
 
 static s32 update_txdesc(struct xmit_frame *pxmitframe, u8 *pmem, s32 sz, u8 bagg_pkt)
 {
-	int	pull = 0;
 	uint	qsel;
 	u8 data_rate, pwr_status, offset;
 	struct adapter		*adapt = pxmitframe->padapter;
@@ -295,7 +294,7 @@ static s32 update_txdesc(struct xmit_frame *pxmitframe, u8 *pmem, s32 sz, u8 bag
 	ODM_SetTxAntByTxInfo_88E(&haldata->odmpriv, pmem, pattrib->mac_id);
 
 	rtl8188eu_cal_txdesc_chksum(ptxdesc);
-	return pull;
+	return 0;
 }
 
 /* for non-agg data frame or  management frame */
-- 
2.34.1

