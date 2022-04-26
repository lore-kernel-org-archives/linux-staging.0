Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474067E
	for <linux-staging@lists.linux.dev>; Tue, 26 Apr 2022 13:53:27 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id ay36-20020a05600c1e2400b0038ebc885115so1118623wmb.1
        for <linux-staging@lists.linux.dev>; Tue, 26 Apr 2022 06:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EnYpaxkZav5f4TJAXC67BWjjIGhseiAu51rAnrYK/5U=;
        b=lI7BSk8KWqBYCpdh38+sEuQTXEGVto0akFD9ogV65L+lfxpWNY7YCAxoHhi3rzbMIW
         ILIDW18W5OozzGvqzIAj1v9qW97xKuPduSfceDbSlqsZRRdWX5fWyJJpwE86dYJqanuQ
         2kluTJmxGisJIgE4Q6bSwOxsvOWImJhvoMKbKdyMTrCSXoPcXDlWPZffdgbf2HISfxPE
         RLnjfkD1OnvoorEv4m6Dy+6oxrG87bDJnyQo9flX4+dxOZh2bSYkpldS3vZMEH1KXHRw
         bLTON0Q1ofUBLNum6tgAxItyw7XCA7dQrDXcm8juB1pC3bGOWv0yXpnNdi+Qo48l05eP
         eyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EnYpaxkZav5f4TJAXC67BWjjIGhseiAu51rAnrYK/5U=;
        b=cygWCazQPmSFGPVBV4zSDrMafFPgu1PI511rLXcqSEnep7KliauuoLz3U1YGNB9PaF
         m/c0krtK4K8Ocxl8yALF38gKNe+F0QmYnomTDrKaaGDxApKodLe/XFED6WFCmOyyt6+Y
         mfXAcGVm/0IT+sl04l1yDNP3iwgmdtZ4O1yKTtZXLMsQBHPiB/PAK3i+zN0zMEu6v7g9
         e9+uuLFzvW0H61NqhuFz2X6vC2exeBTH5dfjYBGi496mUkuNasdCaZM+4oiAGgWcq/0w
         +QML+oMNK1ZleOQEPMxWKij4QtKJFvm1FWN4/Iv5j+J8lwQIqRsMlcGZ1TLFD7+MSjHe
         nvSQ==
X-Gm-Message-State: AOAM531lXhBlic2RE4NVssBF+ip0GRskwHfQW6IMKNoMp2f287zCQWOq
	MXveic6QDGZJuZudVvZJgQU=
X-Google-Smtp-Source: ABdhPJy7jim0MQqG6FtfP8lrRE796ANDund2SRO/1IO4nMn3uKtHCXimtboj+/N76RJ90r5YSwfnSA==
X-Received: by 2002:a1c:6a01:0:b0:37f:1b18:6b17 with SMTP id f1-20020a1c6a01000000b0037f1b186b17mr30518474wmc.146.1650981205489;
        Tue, 26 Apr 2022 06:53:25 -0700 (PDT)
Received: from ubuntu.fritz.box ([2a02:908:4b20:9740:f9ba:b974:8a6:43e6])
        by smtp.googlemail.com with ESMTPSA id z6-20020a1c4c06000000b00392b49c7ad4sm11224925wmf.3.2022.04.26.06.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 06:53:24 -0700 (PDT)
From: Noah Tschirner <noahtschirner@gmail.com>
To: jerome.pouiller@silabs.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Noah Tschirner <noahtschirner@gmail.com>
Subject: [PATCH] Staging: wfx: Fixed a space coding style issue.
Date: Tue, 26 Apr 2022 15:51:48 +0200
Message-Id: <20220426135148.29785-1-noahtschirner@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a space coding style issue.

Signed-off-by: Noah Tschirner <noahtschirner@gmail.com>
---
 drivers/staging/wfx/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wfx/main.c b/drivers/staging/wfx/main.c
index b93b16b900c8..e575a81ca2ca 100644
--- a/drivers/staging/wfx/main.c
+++ b/drivers/staging/wfx/main.c
@@ -170,7 +170,7 @@ bool wfx_api_older_than(struct wfx_dev *wdev, int major, int minor)
  *
  * The PDS file is an array of Time-Length-Value structs.
  */
- int wfx_send_pds(struct wfx_dev *wdev, u8 *buf, size_t len)
+int wfx_send_pds(struct wfx_dev *wdev, u8 *buf, size_t len)
 {
 	int ret, chunk_type, chunk_len, chunk_num = 0;
 
-- 
2.32.0

