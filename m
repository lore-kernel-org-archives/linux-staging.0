Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB702C83
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 12:27:16 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id e3so35541095wrc.11
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 05:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=caezwCrYl8J1Db0QePppJD41dRvS6Lu7c4xekHw9rc4=;
        b=ogmUBzFMtrtluJm3LUTqmaT3xo5LmNaCfiKBDJfpkOna8f++9MsCVdJN50yligWLWW
         hEm3iq2vrBpiP2gERFUx9lJh/6lpuevO2zC29sADMUWrP0nWnEZiSAB5L1TXZrh3Uds0
         XWc4TkTPNc5LXYW7N4biGbzW1GdjvskA9F7tc4JE3PBLM+knEMGA232U23+XehALgJnx
         midr0kGTqtt4mVvi0WbsXIxdQ+dFlFX8Sos/HWGjyh2Zc10DHjYNS+ZgRNf5SnlxBbDH
         En5nPcptw02TFAlnGI/8JrcX5hWlzPcm/UFp4Z9F9DbLCzDdPgFvPxD/ZnJ3YeawQ5VS
         3jzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=caezwCrYl8J1Db0QePppJD41dRvS6Lu7c4xekHw9rc4=;
        b=i1ABNm7lNa8ptaMMZNaXmLJVl5TbwbdHdR2eThdi3MDdeVDABb2rB8bo7NryQrfGEU
         eB8l22fCl64BtCjWNnqPvIgSSpJlCRputQhjVHe/PxeFuwxZyUVNRKTMyntjrZhYNCCY
         zBGf5pdoXroomk64m4Xv9ZdEl8TOx0mO4MdV9hpWLquWB3zddy4ZXZtt67kjR78U4QeK
         5MmEM8Ja/9PC7Xts5rZPZOUKZZH5Be4YBh2PssYLGhTNKiwQfIK3kqZvjE/2/EN/GvB5
         XE+ml/YG7qqgyavqcUUzrkhXv32HULqBIxbGsSMCqj2yM2knNWPry/CEPkorwBTyo0IN
         Xs5A==
X-Gm-Message-State: AOAM530NdMzcWvZ28R+jKE0gsQOUhCqXOdJTBZ/rZ9eFBrGTXqIvECN9
	WrYMLwYi91nPyoeDLj+bmO0=
X-Google-Smtp-Source: ABdhPJzvGs5Kt+CDR6iUtIq0Pynnn7nw1r8K/anNW4nGI6k1FzSzZBcNGXx9uPVf0gRWbUHvA5OC8Q==
X-Received: by 2002:adf:aad7:: with SMTP id i23mr27699723wrc.209.1634473634405;
        Sun, 17 Oct 2021 05:27:14 -0700 (PDT)
Received: from Mononoke (56.red-88-27-247.staticip.rima-tde.net. [88.27.247.56])
        by smtp.gmail.com with ESMTPSA id o12sm9713965wrv.78.2021.10.17.05.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 05:27:13 -0700 (PDT)
Date: Sun, 17 Oct 2021 14:27:12 +0200
From: Sebastian Luchetti <luchetti.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rts5208: ms.c: Remove two udelay calls and use
 usleep_range instead
Message-ID: <YWwWoB3+4HQTD4/t@Mononoke>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch fixes the issue:
CHECK: usleep_range is preferred over udelay; see
Documentation/timers/timers-howto.txt
in two occurrences.

Signed-off-by: Sebastian Luchetti <luchetti.linux@gmail.com>
---
 drivers/staging/rts5208/ms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rts5208/ms.c b/drivers/staging/rts5208/ms.c
index 2a6fab5c117a..7292c8f013fd 100644
--- a/drivers/staging/rts5208/ms.c
+++ b/drivers/staging/rts5208/ms.c
@@ -3236,7 +3236,7 @@ static int ms_write_multiple_pages(struct rtsx_chip *chip, u16 old_blk,
 			return STATUS_FAIL;
 		}
 
-		udelay(30);
+		usleep_range(27, 32);
 
 		rtsx_init_cmd(chip);
 
@@ -4158,7 +4158,7 @@ int mg_set_ICV(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 
 #ifdef MG_SET_ICV_SLOW
 	for (i = 0; i < 2; i++) {
-		udelay(50);
+		usleep_range(47, 52);
 
 		rtsx_init_cmd(chip);
 
-- 
2.30.2

