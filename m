Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310AA322A
	for <linux-staging@lists.linux.dev>; Sun, 23 Oct 2022 20:05:59 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id jo13so3259990plb.13
        for <linux-staging@lists.linux.dev>; Sun, 23 Oct 2022 13:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnolCiMBjl8qX8ASTYaNnJALNGKZaQCXHfWumAnTsTM=;
        b=iYtagsbcU/h0TyJgU4pXRWZSC4sr8vpuy8Tn3ao6ioil6LBbPMIzwZjGjaql/4vVbz
         RiifYv5fBiYrgFc2P2oWJNn/T+vBIVqf9FQc2fNCXMUXL7a6o9BW3G5L1Ql44Ha0MGLi
         FbKjRmtpeIXFP7IadMrxTXTjIV8Ynbz9pHSjvcUm3eQ7AbO6pEVF5+uC1qtCcpo6RidW
         Eq8HzFkUQ612Z/sF9GTYbaav5q06ZkNwUyqWAocx4IUOBRaiim7t7lJQVzvMzDsDxf/1
         ERJsClRVDGY6LtbCSYHTmLftNqyPr+yOUjfpPJloS3RqHW77xMTLz9FR+dRTjcg/cSMf
         RsYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NnolCiMBjl8qX8ASTYaNnJALNGKZaQCXHfWumAnTsTM=;
        b=tGJ9GbiSBrsaKXOLfWRXwvh4wfSGj7+tuHCTguzZABIrpo18rmXszTtFKVctUmcB56
         5etYIzayajcA758SFHDIr1NGKgfSwVwCRTU1Fd41wHI8asdewzZzqlX/c+0KDvpDMakv
         CSydZ0oysEFq7Ml0mbWw/MKFsKb62K33C0iEp6sA2bJqx2XPw9ayfzPY+/gjhXd/XXT8
         8M845mOtDnJ8VE5135RPJ+kZqEOgJREnfdr+4G29e7/6+hKSeD5rt1NJu0D5vX7RNzal
         XczGx926k7t7wC79y4mqcd1KZEDOyOZFha2m4766f5IGWdE9n6sf/IxyrEh4lwdPsZG+
         n9/g==
X-Gm-Message-State: ACrzQf3yEu0R1OyGHpFQzllHKuVkpKM7IV2GfxeQgebkazz6dJCklM4v
	FhuV674ZA12EldxyyYICOmw=
X-Google-Smtp-Source: AMsMyM75nzS235WrzxnOC5yv0x+K2rUHyGvTa2pFF6tigetffeJ9YCziWFB/NGTfaSQAq+/Z4oMfQA==
X-Received: by 2002:a17:902:f786:b0:180:6f9e:23b with SMTP id q6-20020a170902f78600b001806f9e023bmr30930599pln.37.1666555558692;
        Sun, 23 Oct 2022 13:05:58 -0700 (PDT)
Received: from uftrace.. ([14.5.161.231])
        by smtp.gmail.com with ESMTPSA id e13-20020aa798cd000000b0056bc0578c7dsm1130649pfm.110.2022.10.23.13.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Oct 2022 13:05:58 -0700 (PDT)
From: Kang Minchul <tegongkang@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kang Minchul <tegongkang@gmail.com>
Subject: [PATCH 3/4] staging: r8188eu: remove unnecessary variable in rtl8188eu_xmit
Date: Mon, 24 Oct 2022 05:05:31 +0900
Message-Id: <20221023200532.259276-4-tegongkang@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221023200532.259276-1-tegongkang@gmail.com>
References: <20221023200532.259276-1-tegongkang@gmail.com>
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

