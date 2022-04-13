Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C54D23CA;
	Wed, 13 Apr 2022 04:38:59 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id r25so600846qtp.8;
        Tue, 12 Apr 2022 21:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OhTnq07iXAtz0jfkYxAOZJL1OOd02wSKlJiI9TYbfoc=;
        b=AGtVO4+cZMr9M/H/by3ycSQcwTKZGco3sC/YjDjZnVp+eg47fCul7icjFh4ZVaaAjC
         1ksNqXwLJnfRWiQIoJjlV3M9qduhqlvC6Sa1V7yIeUV2RmLitit1jLpBCGvO/we3REs5
         WjqYpiU0lvs5SexnDQWUX/mB6P5PxhUyEzpHr1pVtWAcbOVd+7cpHtLjt7OOSpQLHXzM
         NCCJIazVyd6ClEFTvO8yx/VlUVQ4vWP6HM3S+DeknchS2UA9fXFRSZzCy1Y9/zoUD4TL
         59Eh338+qNlOpv+faTlRG6AkZaThnehaoJV38W6OiNL6co9nUC2g1z1WPId8If9OowQS
         vdiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OhTnq07iXAtz0jfkYxAOZJL1OOd02wSKlJiI9TYbfoc=;
        b=FWXfyFJaBMc5mAQuyR+mQ4sM9bAPiosGeiZFZH4W9jM9MQTTCvV9XfwukYuIxKmV1V
         edjjK46cn3uAxUI1g1Rk94yRORgraxz6BfvbYjbLFt76dTkInX7ZT+bqWUQp8gG3GeJv
         k+sexSUl7fE9bLlNzXOCc9Pj78fas9tiUSx0m9/QOb3sdHA3pHSoRNfWR3mqUUwQw3lj
         JYurcNhGFJ1RNt0Bcm23VLccgzyGdZpXVRGOuZ6sldT/GX92kyQ+PBt5JbcuIGotUQgU
         0Oyf6zsGpz7RWIaM7Ye3hjs8BldnR72kdOLCEzRZNt+k51/AkFHTK0v9LJER2lHIxhoq
         X2ZQ==
X-Gm-Message-State: AOAM530+uZVTpm/kmjFUP67Vx/DiHPmS8icqSsjrZNQg5M8o9LQmb4mL
	7GhT+Kyo0me41yVsXZQs/80=
X-Google-Smtp-Source: ABdhPJwo5/CqCf9GrYiQmYkurX8T2Klm+Wgvd1F5+7KxI5Lh1EoSUEBdsH6RMppjEk0+vxFVd1QTvw==
X-Received: by 2002:ac8:5c16:0:b0:2eb:db39:6591 with SMTP id i22-20020ac85c16000000b002ebdb396591mr5807695qti.623.1649824738317;
        Tue, 12 Apr 2022 21:38:58 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.lan ([2607:fb90:50fb:900e:5e57:caff:f44b:33f4])
        by smtp.gmail.com with ESMTPSA id d126-20020a37b484000000b0067e60283d08sm21984056qkf.40.2022.04.12.21.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 21:38:57 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: johan@kernel.org
Cc: elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com
Subject: [PATCH v3 0/2] staging: greybus: fix warnings reported by checkpatch
Date: Wed, 13 Apr 2022 00:38:50 -0400
Message-Id: <cover.1649824370.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first patch corrects a typo in a comment. The second patch removes
an empty callback function.

Changes in version 3:
Edited the second patch in the patchset to remove the entire empty
function with a void return type instead of removing just the return 
statement within the function.

Jaehee Park (2):
  staging: greybus: correct typo in comment
  staging: greybus: remove empty callback function

 drivers/staging/greybus/arche-apb-ctrl.c | 2 +-
 drivers/staging/greybus/audio_codec.c    | 8 --------
 2 files changed, 1 insertion(+), 9 deletions(-)

-- 
2.25.1

