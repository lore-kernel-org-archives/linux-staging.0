Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489127468;
	Mon, 27 Mar 2023 19:49:15 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id p34so5671883wms.3;
        Mon, 27 Mar 2023 12:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679946553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NjCcLoIlqFNxoJB7I2WmOr2pxCSji/b+9pZvuMvJmaU=;
        b=WkY4SZMvLqxXNdUPpvROtO+jdZcoqHTQnKeXo3qafrs5wa3uJcfMi++yT21LU4WjAz
         Z+lIO24mQUKie7X/4qIV0Kiq1CjXXcE1p+YIWL/AYfUK8f5GM+62TUYeidu3b6Np6ix9
         qSWnBoB5OIoXFX0zf/Z0yhHUwa3dRSqpH09iLV8bc7qT+a27UH1EiiRucD0L63O5JbUC
         0RA4YxV/qjdtcskB4DqaDj3Zjex9/B+08+On/BQyRDE3ky8sFcHjMlXk0y6wZfZB1Lot
         ji5iU3VTXpZa8sM/FafKn3G21ygposz9ovy5+Vy8W17YaExN33OES3ebtPbjMmf43tiw
         +crQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679946553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NjCcLoIlqFNxoJB7I2WmOr2pxCSji/b+9pZvuMvJmaU=;
        b=Zdv2IH9YkrEFCt3Cq3b9IU4Fy6oGzUp4lMs6kNXidnjd2G3G6GufZvm+qGtmKXlL5Q
         JE5U4x0ywiVMRH7ihYAMctxRzjgXd4y3KsKtYvTDv1F1WgjgEgCXHMpwo6ugjdPU308V
         HBJn5e6lif4Sgi0gEXG+u9Bp3KV4a7d/KXvqDDCXPJfLsr5Yfhpbf+E0yFZpzV9oTZv7
         tEL0Lm0HXHKP+c6MD5KcQwblU0C2EW0ioRySZnPAqHY0aC4YHDiPERucW38wzjzcmscl
         1XHiBC3wpdKIk5/pdss3h9JRlCi7/oySQHv5HfKPR3ZQzO4clkdhXD1AIprN/QHVVdpz
         O77w==
X-Gm-Message-State: AO0yUKVlxn+8t+Da5hwLOYnpVDE5M/hWV0MiY63yQ/4h2eZNoryq4NHP
	qDvR9qzT6i9+JrBWECbuekvBcFND/aYe0mKv
X-Google-Smtp-Source: AK7set/se8+ke/Z5Xe1dYsL+TqqBgCJRwO6mI/LcJCRwMkdUheUkvvVzWR/BONIaftO6KEfHKtOQ6Q==
X-Received: by 2002:a05:600c:2182:b0:3ee:3b7b:73c1 with SMTP id e2-20020a05600c218200b003ee3b7b73c1mr9795173wme.28.1679946553125;
        Mon, 27 Mar 2023 12:49:13 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id c13-20020a05600c0acd00b003ee42696acesm14661366wmr.16.2023.03.27.12.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 12:49:12 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] staging: rtl8192u: clean up comments in r8192U_dm.c
Date: Tue, 28 Mar 2023 00:49:05 +0500
Message-Id: <cover.1679945728.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up several comments in file r8192U_dm.c

Changes in v3:
 - Split patch 3 in two patches, one for '*' on subsequent lines and one
   for '*/' on separate line, as suggested by Dan.
 - Add spaces after '*' in patch 3 

Changes in v2:
 - Remove the 'commented code' and 'revision history' before
   reformatting the block comments, as suggested by Greg. There is no use
   in fixing comments, only to remove them in the next commits 
 - Patch 1: Changed the description and removed extra blank lines under
   the change history
 - Patch 2: Changed the subject and description 

This patchset was created after reviewer feedback on an initial patch.
The feedback suggested additional cleanup comments. Link to the first
patch:
https://lore.kernel.org/outreachy/ZB2a5zwYpBZ%2F6qwU@khadija-virtual-machine/

Khadija Kamran (4):
  staging: rtl8192u: remove change history from comments
  staging: rtl8192u: remove commented out code
  staging: rtl8192u: add '*' on subsequent lines in block comment
  staging: rtl8192u: add '*/' on separate line in block comments

 drivers/staging/rtl8192u/r8192U_dm.c | 206 +++------------------------
 1 file changed, 23 insertions(+), 183 deletions(-)

-- 
2.34.1

