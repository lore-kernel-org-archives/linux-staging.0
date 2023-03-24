Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFE127706;
	Fri, 24 Mar 2023 22:23:09 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id i9so3180427wrp.3;
        Fri, 24 Mar 2023 15:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679696588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NY10APJiMF6Bak2tNJJ5hJLrQp4ks52I/JpQMFq6tI4=;
        b=SGaanR3nKGyiKLdoCEL0XAbHWj2MYCnpR0QUuR62Gzcvj8ev+pKbmddccnHWpZcSvX
         SkCnGjS5Zbs8x+mcjXqCzUQ7GnCUUSsDS3OwsPV9lQNp/R47VNxRqFvRO0qGor6MXn8i
         3Ybzmi7XU5/hfBAG1IDsji//fdZXknIw0yaRVCRphHMBN0M4CAnKJ09XfFSRTjkG1H5z
         SykfNVRMkbAL4JzpMNzYEKF5SdinHbfgcRjjlFskUSFZsrpqyBnfsdx+B0Pl2V0EO/f1
         txwcMiuXn/gu3AGZHhoLCVYEHwhTAAEXBCMSZdQLgZyr0KPFlRdBqw/fo5MenNZXTgux
         4y4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679696588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NY10APJiMF6Bak2tNJJ5hJLrQp4ks52I/JpQMFq6tI4=;
        b=ODrgUMgdmUrud2SkajRfCzmiq3X0ZFU9ncVerGsYWa1AYL5/Sms4s3JKDFfeiZEPj0
         y4HjvfFqa4H0X4WO2MPkJdxDxhBi5337bOczc3Qmsf3xWfvzcXlftJEij5dChuqN7eSd
         Qt7oAp6mUnjqpKzIH9xX3UVbz+2/czhST7LylJH/Itp9S900bTxzOfJxWXV3hHoXg3yr
         jfE2/vgnsVCD3zfqUxUsywdsLu3G0ibOOwQxc/dZXh+LMGQide5EEQ6+JkizSRX5ADbZ
         EpZEZjqwj5XhMu6eiVd5ngfvAg1gCXo7R9wZdTwd1m2HqdNAmwmIERDJOYIU7/oAwnAw
         kKkA==
X-Gm-Message-State: AAQBX9ftTyWaBaBNYZ+iDs9lrZJVOVQQrWDAlS+l2kPqk4PUCHVz4EXq
	8Hd3fU7mfJlJftUmNQykwFQh8XrQP1WwPw==
X-Google-Smtp-Source: AKy350YjCyNrGOXLSNzG6Y4T9xQmpvl2pHNPFoV0P4a2gkUH3zb5w/tOhVhNhk0+WbOxP/40illlEA==
X-Received: by 2002:adf:f546:0:b0:2db:9526:b6ec with SMTP id j6-20020adff546000000b002db9526b6ecmr3468603wrp.58.1679696587890;
        Fri, 24 Mar 2023 15:23:07 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id m8-20020a5d4a08000000b002c3f03d8851sm19161446wrq.16.2023.03.24.15.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 15:23:07 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] code cleanup patches
Date: Sat, 25 Mar 2023 03:23:00 +0500
Message-Id: <cover.1679696291.git.kamrankhadijadj@gmail.com>
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

Changes in v4:
 - Changed the subject of the cover-letter that was mistakenly edited in
   the previous patchset.

Chnages in v3:
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

