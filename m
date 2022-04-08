Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1ED368;
	Fri,  8 Apr 2022 01:12:56 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id c24-20020a9d6c98000000b005e6b7c0a8a8so1648749otr.2;
        Thu, 07 Apr 2022 18:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e5T80dpqvmJyYNxCZPNBDf8/a2ZuY3TCPiPd35SWGCc=;
        b=E7OoQvNxDDe09i6QR9xdARsM79ePm/M/GnhEUuka5ePvPKmxSzVeCIx+NOUan7gbw2
         hMmdroWzjdnnUoL5vl3SlKGQdmfvw3WdfpaepUJDo4sqOjA4eRXh4JTCoA09a+sE/qsT
         CgoOQ1qVoshjmzOnAv/Pml3JdvMwX/O4IH5Z7aBAKVtA2iS/EAcdXfyzCGRZB8dcKaey
         OxKq8aOE4x8UQe2KPOep/afFdjryf7N8sOLfozrnDfirinDtqBvZvFES4+LkdfM+wRrd
         ZosfM1M8JCbtiWobaI5NYqCK2opbrLQunPVUWQi0xBUzYHypkKtzRukNwQqSG+F8QYLe
         B1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e5T80dpqvmJyYNxCZPNBDf8/a2ZuY3TCPiPd35SWGCc=;
        b=KuFBWomUsoODvJU4+/d4N/vocJF5x+W2fYeV+YdS/hQWvF0qFIjNmqZ0XEwWbJ+7Jo
         WCCJC1fY6tMCTbrU/ih72fXGs18fBUGcKp/AE05RB8X89ZQd16P270HUtUBUkymAVTjR
         vEWVHgUzVSJRgu+kYMZmS77EHFNK3H5R5Qt0YyOoWsCy8ioD4qZOPOtenb1zw9FMBp4C
         u1CsvUM4ViKcxcsnu+mdWc0rEr7xW1r/dDvvc+cIfacHa/MtyVkeMymSfFuvAHbEDzWk
         QAdAoqyV/Eoa1Xa0MmIIySu6F6hsnkLD3Vy7WFI6rwt/zZY79PhI4oQOkUrb7gkeoz0q
         FZ7Q==
X-Gm-Message-State: AOAM531VIvtGG2Cs3p0E+YeY2hrzpLarQoYyNEEwJarVPw4VyJWn0M07
	rzC6PyKSfOAG7L0+3QGKDn8=
X-Google-Smtp-Source: ABdhPJzWZsVb+0FBT/UfuuBz57l2HrHGbM/x5tYjidzAbn3d6nHElcTM6GoDapqOrADJyP07SvO7WA==
X-Received: by 2002:a05:6830:4cb:b0:5ce:889:bc4e with SMTP id s11-20020a05683004cb00b005ce0889bc4emr5848652otd.87.1649380375606;
        Thu, 07 Apr 2022 18:12:55 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id 190-20020a4a0dc7000000b003244ae0bbd5sm7795463oob.7.2022.04.07.18.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 18:12:55 -0700 (PDT)
From: Rebecca Mckeever <remckee0@gmail.com>
To: outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rebecca Mckeever <remckee0@gmail.com>
Subject: [PATCH v2 0/2] staging: rtl8192u: cleanup of ternary and if else statements
Date: Thu,  7 Apr 2022 20:12:49 -0500
Message-Id: <cover.1649378587.git.remckee0@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches replace ternary and if else statements with
more readable statements. Found with minmax coccinelle script.

---
v1 -> v2:
* Patch 1: "staging: rtl8192u: replace ternary statement with if and
* assignment"
  * replaced max macro with an if statement followed by an assignment

* Patch 2: "staging: rtl8192u: use min_t/max_t macros instead of if
* else"
  * changed the type argument in min_t and max_t from u8 to u32
---

Rebecca Mckeever (2):
  staging: rtl8192u: replace ternary statement with if and assignment
  staging: rtl8192u: use min_t/max_t macros instead of if else

 drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c   |  4 +++-
 drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c | 13 +++++--------
 2 files changed, 8 insertions(+), 9 deletions(-)

-- 
2.32.0

