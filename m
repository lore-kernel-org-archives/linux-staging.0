Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1449672
	for <linux-staging@lists.linux.dev>; Tue,  4 May 2021 14:51:44 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id di13so10794980edb.2
        for <linux-staging@lists.linux.dev>; Tue, 04 May 2021 07:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S3N6g2UZbr5ImaLmOMaKuHosTydvdNGVUAq4Ih6ZjGg=;
        b=Q+3Uut+DEXFu3aeJtAdIHi1TB0Z2UM+XTM6YX00MQ4hY0mYpdOcKqYVPRvd3a+/nf9
         3RGradfSOzpRF/pwVnxLfmH4eXS5rIH/6jYkID4LLwE5yzJVsmLx5w/f5+9+apjqfino
         Gj6I9Pu/AE0mW1pmPWfpW4KCujvT5uc1L5kduchyZXgbjyR/OcaAvQqKRrNYTkT1PuiG
         +EWDz/Bnz0a92J72yBLlwkJKkHyrLxUVD4SC5KVPE24jrBpGk5D/geCiWDvlDHzFJAKB
         3chniEoqSOnmfPMJk3R5obAkg1Ueh5m9S8dvdcRslTgbQXhImNKm+iuMc5ooXvDE21Ul
         quKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S3N6g2UZbr5ImaLmOMaKuHosTydvdNGVUAq4Ih6ZjGg=;
        b=VVpzO9frNp259KIxTyVGUwpvcIpkrobSYVcSh6a+IyGS26u4PbS3wJZzzNwSLRLRiP
         lpZwwxPZHA3uKwG3fg/MLfV5QuB4iTRqfdIBspbFeCNVT2ojOR3oaBSV8rOUBdOd+4MG
         brRUNZQgy89gkxH2dbQXmH4i8+yrP7wHk0qo+Yrd130v4GnJLh3EF/7FFGItxihYIxjK
         sz90MO33WXhHoAb34u8bw6ZHzvoqmXmEadXXZ9Z131aPb09c/tpyWONxfiFTrWNyHWu/
         JUtxsXIthQVou6oPKguEBu4jrUwLFzWSrEaurmeumL0Wxg7V0YUWb+pfNV8x0DDeQRVE
         DxDw==
X-Gm-Message-State: AOAM533wWDXv66eviVkgffnQtHWCOdK3apdZGlSxN7bRXj65WEDM/hVV
	qKqjITH1ok8PRRvaggv2iDU=
X-Google-Smtp-Source: ABdhPJwsEgQN9zyPIxU3vzTcGYP3pY3KxBCFZM2yvkApgd5OvH1PYiyNc1z7JT0JEZ8tFL6mUfVV1A==
X-Received: by 2002:aa7:c2cc:: with SMTP id m12mr26296094edp.1.1620139902688;
        Tue, 04 May 2021 07:51:42 -0700 (PDT)
Received: from agape ([5.171.72.210])
        by smtp.gmail.com with ESMTPSA id t7sm13644977eds.26.2021.05.04.07.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 07:51:42 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] staging: rtl8723bs: use in-kernel aes encryption
Date: Tue,  4 May 2021 16:51:37 +0200
Message-Id: <cover.1620139727.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset replaces the private AES routines used to
encrypt data with in-kernel ones.

NOT tested.
--------------------------------------
Changes in v3:
	- Added NOT tested advice in cover letter

Changes in v2:
        - Move aes.h include file in .c
          file, where it is needed


Fabio Aiuto (3):
  staging: rtl8723bs: align argument position in a new line
  staging: rtl8723bs: use in-kernel aes encryption in OMAC1 routines
  staging: rtl8723bs: use in-kernel aes encryption

 drivers/staging/rtl8723bs/core/rtw_security.c | 328 +-----------------
 1 file changed, 15 insertions(+), 313 deletions(-)

-- 
2.20.1

