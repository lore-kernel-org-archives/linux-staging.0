Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D446F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 09:34:20 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id e7so21468293edu.10
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 02:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UU43qIhMTe6edOnTRhDNuqs4/6Fcr5WC9xOEehVRvzQ=;
        b=AhlaDFvX1senwjL60n28pgpN8+6gKhh33Pt/Signy08TCbnbAPNqQ0nA9Z1wo0DACP
         XLUZZlIGeGzcaHTmd+JpG4KYSfM9vitIKd1P5deDTBfyxob4ozXwI/IAn7lD3A3FDrsB
         9tvyGYIlG1pW3EYDXNiuxvNTv/HFSTQFXS3NbWkMEyhachGVOP60aJdrz3UsGuVD9k2j
         0dDPpd0F13WpJTGvjKm5SPcShORoXEsa4HqN12CeKRjXrcZ9Z/m48px3DX2cnCZqoU0H
         6KKIHpuG1nf38wTPh0sf2PeJ5cMumO/rbCIj1xb2B9gEChBrFNqDxAbNTYCMnmu5Wez1
         syiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UU43qIhMTe6edOnTRhDNuqs4/6Fcr5WC9xOEehVRvzQ=;
        b=IL7da17G+UrIia+6k3NxKp1BvGNTNy2RJsZGVJ1Xquxm/nzaRrjhQ+VIrdHSX9lnXx
         UeJmEbpdtf3QCzpcfyQtv5mt6gX+zMo33mBnHxydSjtF+ijqzM04Fd3YHy1DqpkGEy24
         Fl01F1UVSfpaA9/Cn6vJlQWyhTgylbiF1qewH9k3UDfMLWNgpFjop4jbMMi8ilLSmgPE
         FMW92LIOeSrV1w8Bqw9luRfgy9E0XZIuM5QELZYwwSWaM4jfc6iuus+ZuvbvBSWnVDrU
         KdNc+0HlTWTWnAjH5BrwPQK/08vMk1GfwD7EDKFCRX9g1Sqz6Hpt5rYzIh9nzTRBDx7S
         zKyg==
X-Gm-Message-State: AOAM532gbxdQsjmslFQS3iVNwtGRFxuXbHnc4zrRK4DFZq2J0BFu13k5
	I0vjttixUkbpC8IOLbb2pAY=
X-Google-Smtp-Source: ABdhPJzlZT+Dj0fdTynGmGpq9s5/jAaugbVporKqJvGfTNKbCnpA8I1EznveD1AzeWoSx1g2mSyCQA==
X-Received: by 2002:aa7:d74d:: with SMTP id a13mr2651401eds.199.1617183258604;
        Wed, 31 Mar 2021 02:34:18 -0700 (PDT)
Received: from agape ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id bx24sm828657ejc.88.2021.03.31.02.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:34:18 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 0/2] staging: rtl8723bs: replace private macro with print_hex_dump_debug
Date: Wed, 31 Mar 2021 11:34:05 +0200
Message-Id: <cover.1617183040.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this patchset replaces RT_PRINT_DATA private macro for dump hex values
with the kernel helper used for this pourpose.

Fabio Aiuto (2):
  staging: rtl8723bs: use print_hex_dump_debug instead of private
    RT_PRINT_DATA
  staging: rtl8723bs: remove unused macro RT_PRINT_DATA

 drivers/staging/rtl8723bs/hal/hal_com.c       | 13 ++++-------
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 22 ++++++++++++++-----
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  3 ++-
 drivers/staging/rtl8723bs/include/rtw_debug.h | 19 ----------------
 4 files changed, 22 insertions(+), 35 deletions(-)

-- 
2.20.1

