Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C5533C7;
	Fri, 24 Mar 2023 22:31:36 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id m2so3180384wrh.6;
        Fri, 24 Mar 2023 15:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679697095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MIcRYN1jbAzyDvYI035gfgvA4GBDGHeabBKjiIiu+YA=;
        b=YfsxhWwl0K6P35tY1w//PN63ezROkJ+gcDejUZgFu73sxkVV6Bdt9+l8FezY4S9Gcn
         BTcgotEy+63bdQGE6FalmRU2D18XI4Oga5BmNFJ7G1m8LZuDV7JMw9U0QCzFSj4U+NxJ
         Cz3R9dT0hXE+DwjjGs4qjdosRDj5AmA0sL7p9wVNy8eGmi0J+VZu1jblpsHXeX3m9VFc
         4OMhRiGHOMcj2do5x9Wy1M4v0V3k9pNm3UR/xSmPEg+UkY0NiAUOhc/USfpCMO/IwjB5
         nYbw7DYsTyJ9RliwC6nN/9MPjJr/GjGSacBUho+GCdecNOUwqAcbTcvzVFeXOEABN1tc
         U0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679697095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MIcRYN1jbAzyDvYI035gfgvA4GBDGHeabBKjiIiu+YA=;
        b=rR1273f3HgqIZPkvY/7CJMU8LwN8bqDJ16A4r+e8PsuilWTvm1DNn835EqVlt74yYh
         /7/wXGKeU0oGdBLYy/ZzYVdiKMWn82se3NDONEH7c/cCKuY165sa5CvoHW4+idRjelFX
         mX1tLsoThdrR+KGYOeyiSZLX0zy7+iowckMVpnS/4odB1biRajS0QrMkKGacqxIzU0Zb
         I4g84HeQ2HPghsGuQ+EHXCdPkY7tj4apb+Rx0UZ27Jd3bHi9oBf/W0eFFuTuKiBjNF04
         VE64aL18x6V4pXdyRPeLSIe2MlgKKYZPa534ROrCSD4AEkBG1iKyStvuOWQsq3UYvzEx
         cGhg==
X-Gm-Message-State: AAQBX9dG0lJo2x/SscBYarOI7jPvs9dClFIamJLuxSlyfJCtrwz+WaSY
	8wao7zJKUlx9R2HZSCh/1P4nJATai0NgQg==
X-Google-Smtp-Source: AKy350ZrBODnkxChGN1cL026reqMl5jlUgk89UrhqSecgD8UKQRHj0oqWK5CjIUcvevBmJfi6aoQdw==
X-Received: by 2002:adf:cf04:0:b0:2ce:a897:9fd0 with SMTP id o4-20020adfcf04000000b002cea8979fd0mr3146036wrj.6.1679697094998;
        Fri, 24 Mar 2023 15:31:34 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id d7-20020adffbc7000000b002d5a8d8442asm14984138wrs.37.2023.03.24.15.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 15:31:34 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/4] staging: rtl8192e: code cleanup patches
Date: Sat, 25 Mar 2023 03:31:27 +0500
Message-Id: <cover.1679696777.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix several cleanup issues reported by checkpatch.pl in module
staging/rtl8192e in file rtllib_rx.c

Changes in v5:
 - Resent the correct patchset becuase mistakenly sent a wrong patchset
   in the previous revision.

Changes in v4:
 - Changed the subject of the cover-letter that was mistakenly edited in
   the previous patchset.

Changes in v3:
 - Changed the description of all patches in order to explain 'why' the
   patches need to be merged.

Changes in v2:
 - Resent patchset with the correct email address

Khadija Kamran (4):
  staging: rtl8192e: remove extra blank lines
  staging: rtl8192e: add blank lines after declarations
  staging: rtl8192e: add spaces around binary operators
  staging: rtl8192e: remove blank lines after '{'

 drivers/staging/rtl8192e/rtllib_rx.c | 73 +++++++++++-----------------
 1 file changed, 29 insertions(+), 44 deletions(-)

-- 
2.34.1

