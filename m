Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C972F2D;
	Sun,  2 Apr 2023 14:32:52 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id t10so107524191edd.12;
        Sun, 02 Apr 2023 07:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680445970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=btTikhkSAhCNIjZnkFaaVYNDj8dPGj1R6e13KUaPBKQ=;
        b=GoKwnVSzTLPQiUQiv4d2EsRl+TJeqJ4ImhxfaM4msiuHVkekw7pKa9OtNb7vtrz1M1
         vzlouMNmYme95Hr1OZxELt/6G4GWozhmGLW1aaOujotlDdHrvRdA7kzaE5XXiOILsTDl
         gwqibkZgg1Ya5A/+2xgLdgXEH8UMbFh2Vnj7g8ci1ruRkCKznIrffjzgdBRjzdc6rLT7
         PJ8bOpZfMfPiK37txnZp679ddQoQakB9i+blSoLy3G9L5sVaci5QCm1LH4lfoCQgdbeU
         zyIcvM0pstBV0mKsdSp9f+6sS/1GA5bgvudMRCY9IenMmpt2QicqU0OjbojKj2r5Mcv4
         73ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680445970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=btTikhkSAhCNIjZnkFaaVYNDj8dPGj1R6e13KUaPBKQ=;
        b=4oe0MB4SSzhujOn46euMkA1Lx7UQFP+yTh6yAO46+pe1U8Amw6dOmydmoNd+mrNeoV
         nZeq/BRcXJWuvQk4jgMvWLEe5EIJJPgugMKwwvQciCdCQID2MDvA55SCQNgMkL+p7v2O
         ELC+D30em81dW6sqF6QQ0PRG+jBeXtlsVF1CNF80lLtqad1I1lsA4s0+colDS2kXUpOM
         JFK8QrZyAPZmA+9kanRpXjJQbB7erqCVsv/GbWTVAG8ILvyo/nrKCJ9+zyUa2OWVA6yE
         oZSJya7UGHDWSbnSM8QfF4Bh0Nv8DmvNQ32xIxvm770Xfq2Zd6vYuWkBiM6/x5AjEIs7
         zR5g==
X-Gm-Message-State: AAQBX9fvxKS0/dKz12vNuOkQqU2iUp72AzRf670bn7Oxv/Jm5cQsswmo
	oxrc6l2QCTEN+1Vr7API5crV5v+e1M0aJQ==
X-Google-Smtp-Source: AKy350aZdFkDoEKRIqv/GHTM30RquYGykcCtD+5cOTSeMjg/39EC+NgfkiSPTUO8+kcKgpFheMsvXQ==
X-Received: by 2002:aa7:c9d6:0:b0:4f9:db7b:b6b4 with SMTP id i22-20020aa7c9d6000000b004f9db7bb6b4mr26956323edt.40.1680445969959;
        Sun, 02 Apr 2023 07:32:49 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id p18-20020a170906839200b009476dafa705sm3273292ejx.193.2023.04.02.07.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 07:32:49 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] staging: rtl8192e: fix checkpatch issues in rtllib_crypt_ccmp.c
Date: Sun,  2 Apr 2023 19:32:41 +0500
Message-Id: <cover.1680445545.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix several issues reported by checkpatch in rtllib_crypt_ccmp.c file.

Changes in v2:
 - Update variable_name in PATCH 3, 4 and 5 to dot11rsna_{variable_name} 
 - Remove comment from PATCH 3

Khadija Kamran (5):
  staging: rtl8192e: remove extra blank lines in rtllib_crypt_ccmp.c
  staging: rtl8192e: fix alignment to match open parenthesis
  staging: rtl8192e: avoid CamelCase <dot11RSNAStatsCCMPFormatErrors>
  staging: rtl8192e: avoid CamelCase <dot11RSNAStatsCCMPReplays>
  staging: rtl8192e: avoid CamelCase <dot11RSNAStatsCCMPDecryptErrors>

 drivers/staging/rtl8192e/rtllib_crypt_ccmp.c | 32 +++++++-------------
 1 file changed, 11 insertions(+), 21 deletions(-)

-- 
2.34.1

