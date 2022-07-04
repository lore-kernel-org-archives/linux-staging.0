Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40677E
	for <linux-staging@lists.linux.dev>; Mon,  4 Jul 2022 23:55:39 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id r1so5115475vke.8
        for <linux-staging@lists.linux.dev>; Mon, 04 Jul 2022 16:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=HXqolatL4SQyTj0ceko5Sk5ywE4eu7yu5fe1t3jCDWo=;
        b=moyHZjjONm0sHNE/3+KuiHTSDbgygmcRVtp3+trbxbNTNGtjKHiFa5jeSx6hoG6J2N
         N8v1cyUIXXdQpL0mi5gceS+HofQgSdc7Jn21OcTKfDakM7gbYgtLrhsO6slaFD4QiiF9
         4cjd1hEeyy16PG4RkOngUNgiVPyVEHwptwVrUJkncxq/n0Egj3nmKnEAnA8PGrU97zLR
         GUL1r9cVhtjQbRsT9HhnUOFgbyil1YaTxvto3qKIIJLJb7it9T54jsd0bBZuoKR3QcN9
         nq76VDGNWUpoduax5Chr0W6IlCulYP5adtUSlf0O5suGUZ9n6Ro09lOr+22XyqHoRMM9
         U/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=HXqolatL4SQyTj0ceko5Sk5ywE4eu7yu5fe1t3jCDWo=;
        b=6PKWKOiF8td8eCnQqtYHY/NFttEuK2/WQjq7FpcyjuavT/h0+FZSA9XkUBxq061h6b
         wjKfXqZ5MQHzLv2gDy/1byZ0qVmvbd3ma5iKCmdZaXLkJqDnXxCQQ3c3fGP/0YMRSPHf
         91WICVm24ZCnQGIPQcBDDOqYm17AQlRKJejn27XJH5kohBJ+VWaBL4ShC14aORvTG7PG
         DJLiQV7SdfvLvorLZcf2tpo3hbScGq32UOc7Pn8VijTsQMlDS2mtA15NtnH8y0mqBg1D
         plFj4O93K/dvKu0Lr4AzmN82Dy0d4BzYzkmU9MP3K7AfKpdsYvKgM+kJspcWVTlEOqP/
         B5lg==
X-Gm-Message-State: AJIora+TQfAkVteWhYNWfhjWPJiyJX70WYX61XxdgHcU1O3zuKEwLrM4
	uxCnMXMuMCvbiBdgFb6txSw=
X-Google-Smtp-Source: AGRyM1tSX4aKlsRsBc8BTpf9MeuTfq3Jabrgf+G95rta6HR3FXWVh0tQcPmh2hM+Y31hxnNRD4TErg==
X-Received: by 2002:a1f:abc3:0:b0:370:e9bb:9779 with SMTP id u186-20020a1fabc3000000b00370e9bb9779mr5458676vke.38.1656978938484;
        Mon, 04 Jul 2022 16:55:38 -0700 (PDT)
Received: from debianmain ([190.236.207.56])
        by smtp.gmail.com with ESMTPSA id f185-20020a1f51c2000000b0036c691b1ea8sm5426542vkb.33.2022.07.04.16.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 16:55:38 -0700 (PDT)
Date: Mon, 4 Jul 2022 18:55:35 -0500
From: Rommel Rodriguez Perez <alrodperez@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: r8188eu: Block comments use * on subsequent lines
Message-ID: <YsN993FTljv5LYT3@debianmain.debian.pc.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch modifies a comment in order for it to comply with Linux
Kernel style guidelines on comments belonging to  net/ or drivers/net/ by
fixing the missing * at the beginning of each comment line and removing
the initial almost-blank initial line from the comment block.

checkpatch output:
WARNING: Block comments use * on subsequent lines

Signed-off-by: Rommel Rodriguez Perez <alrodperez@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ap.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
index ac6effbecf6d..5bd9dfa57cc5 100644
--- a/drivers/staging/r8188eu/core/rtw_ap.c
+++ b/drivers/staging/r8188eu/core/rtw_ap.c
@@ -654,18 +654,17 @@ void update_beacon(struct adapter *padapter, u8 ie_id, u8 *oui, u8 tx)
 		set_tx_beacon_cmd(padapter);
 }
 
-/*
-op_mode
-Set to 0 (HT pure) under the following conditions
-	- all STAs in the BSS are 20/40 MHz HT in 20/40 MHz BSS or
-	- all STAs in the BSS are 20 MHz HT in 20 MHz BSS
-Set to 1 (HT non-member protection) if there may be non-HT STAs
-	in both the primary and the secondary channel
-Set to 2 if only HT STAs are associated in BSS,
-	however and at least one 20 MHz HT STA is associated
-Set to 3 (HT mixed mode) when one or more non-HT STAs are associated
-	(currently non-GF HT station is considered as non-HT STA also)
-*/
+/* op_mode
+ * Set to 0 (HT pure) under the following conditions
+ *	- all STAs in the BSS are 20/40 MHz HT in 20/40 MHz BSS or
+ *	- all STAs in the BSS are 20 MHz HT in 20 MHz BSS
+ * Set to 1 (HT non-member protection) if there may be non-HT STAs
+ *	in both the primary and the secondary channel
+ * Set to 2 if only HT STAs are associated in BSS,
+ *	however and at least one 20 MHz HT STA is associated
+ * Set to 3 (HT mixed mode) when one or more non-HT STAs are associated
+ *	(currently non-GF HT station is considered as non-HT STA also)
+ */
 static int rtw_ht_operation_update(struct adapter *padapter)
 {
 	u16 cur_op_mode, new_op_mode;
-- 
2.30.2

