Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A577C;
	Tue,  1 Nov 2022 12:38:19 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id bp15so23305460lfb.13;
        Tue, 01 Nov 2022 05:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ni6vn8aimD8dBtlaB3MTAcv0y7oV6QdV9767C4/MxeM=;
        b=Gs6+JT0tW5QX4OtsTieCfJKqxvl9a2tvmT9u/J87RBt11BEKk5vkf1j6z2UZuG+wwH
         JI3BWdvb92O6Dmwkup0hjqy9bn2+CTGBe/ongbaVe57a90KY5/uwbJcX29ovrVobTt9q
         pcDD/oITjc1M/vas1KJAU9gmNDsW23p6vaD9rA8sSSA6AuC0zoy9U2nua8T+e0XFdssL
         HXP3VkMoJyN9X00Rr9Gs0ctZk5T9u4pKYvFnsROszQbfaqF54/uoBMzUc72kdjIJuLmG
         bmth3KxSC6Z8VHYeUW+bWWFmFIovpIArTcAZpe2uF0LzrISG9NeIZ1/AOESCtLY26bq0
         MsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ni6vn8aimD8dBtlaB3MTAcv0y7oV6QdV9767C4/MxeM=;
        b=yc8g7UvOlXDUtxMujeUKyMioO5AXp84cF2zEjQqekUqydT0VKiHlS3TW1Z5ps9kz0o
         tAYvWZNw1Vxqpkpijo1yRPjudWD9+F74kQMAXOiENF2x/M2gekzs17gp6YlzJUud3p/e
         8lqoLwJv3Ix4sLTSRTy+pvwdVcCy1p0lGCxXVFfgpyaVDsk//+IgvowUTVRgUTEmqKID
         4dpnwo/o0fc355sgXt9ykzPKfqYmQ4NVN0HFp9/VpS8Xl6uHxPB0LK2ZEyiKXYkcp/Cr
         UfXdhh+LxhJNyyL1I6jAUymLqNXxaoGBIxjbwsZHq4m1jwNKX18qcm+Bvk3/5o50AS2Z
         ID2w==
X-Gm-Message-State: ACrzQf3K1HIK4E9W8DeBORUAc5AuZz79vkdPFbR7pJhX8evff03r8/zE
	ECaUoU1a+Eb3qd+6UIVlP5c=
X-Google-Smtp-Source: AMsMyM4YBxuKAD1N/O56UOTNdKrmaccrmfHrTbOOo7N3Dz51hpmvObZj7Ulwam3JZzNyYa+SbRUiVQ==
X-Received: by 2002:a05:6512:220c:b0:4af:a589:44eb with SMTP id h12-20020a056512220c00b004afa58944ebmr6993568lfu.383.1667306296952;
        Tue, 01 Nov 2022 05:38:16 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id p21-20020a2eb7d5000000b0026e897e3236sm1771625ljo.6.2022.11.01.05.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 05:38:16 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v2 0/2] some checkpatch fixes in the file rxtx.c
Date: Tue,  1 Nov 2022 12:37:58 +0000
Message-Id: <cover.1667305446.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These fixes are focused on the function s_vFillRTSHead

v2: changed confusing changelog messages

Tanjuate Brunostar (2):
  change the function name s_vFillRTSHead
  Join some lines of code to avoid code lines ending in (

 drivers/staging/vt6655/rxtx.c | 48 ++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 26 deletions(-)

-- 
2.34.1

