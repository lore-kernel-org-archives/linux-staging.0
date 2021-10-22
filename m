Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8DB72
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 09:37:43 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id y3so1215165wrl.1
        for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 02:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TrLGl5J1Fh0jBQ3bl4JSYt92D3B2FEdMHUQ1wG7PfLM=;
        b=BtXoJwbcssnAYaQiLN8TVnM1N6szpyGOWkHG+klTa3lYOOK7SD3bPMJDQKr6ugldKa
         X/h9RaNBWNhhtyeBkwfFRal8W/0PQ0B1mjP30ce/cPPuEnL+LUG2uZ0BGGd/WpRsvEsz
         xSq4RWDb7IShOmcOz6hISkeHC+11R/RMrUa0JM6YjQ7tSkoiMKzbWaUJMntFOzobl+K9
         Kq/K9KupUqJMp7dGpN9sKIcvsAUSl1s8QTvOvXIKgHAGDYj9wOF1jpQLRR6BBDchJnkF
         ZB+T/8hxFtpE9CB8ICqjQ97sWQ3fZDDTpe8II5D/pzZRslyedOQbrqsWTZ5MXW6eIfuP
         vgfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TrLGl5J1Fh0jBQ3bl4JSYt92D3B2FEdMHUQ1wG7PfLM=;
        b=QnGgWXPt1ZBDGOVhkjQJQqY3nijrPOb4gBOp8blSMFJjz6LuCTtCqUt2ucDDvEGtCb
         vhR4kpwnCltEgiBONyAjw22zSQu3sv62dJ3klcYyr48cfU6dQkHD9odyful2s3iwOZdo
         tfUCv9zMrwiemTDdO4g5dyj1qbBvmXEpzKAhv6ylORknp7K/tCDJtoZlcV/vUrm06eBN
         WAEjOhGnIIOZiK0dEV+huX3h3kEE63VrSL52TICjzXuVbmYIQqPEpAjX1DKsacwcSIwx
         58o/5YGqHlTCi+j/Mev+Tt/DFvnPUlw4IFXWilzn0v/DBClS7ktHzr47e89GaZWXGMfQ
         /vtg==
X-Gm-Message-State: AOAM530+xsboTULcpAiKG1XU6Q8hBx+7YJ1KFNJHBbpjhUXQd+nsqD8S
	5AOaRZzNyBdO9hFfm62QtAI=
X-Google-Smtp-Source: ABdhPJy23x8Y3fnkzITNiQKGVTYLReIhfCXxeOtizg8lIJkcKVMmu/UXzVLHBvyi2TOdL7Whq6Pfkg==
X-Received: by 2002:a5d:4481:: with SMTP id j1mr15034248wrq.6.1634895461773;
        Fri, 22 Oct 2021 02:37:41 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id r15sm1643602wru.9.2021.10.22.02.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 02:37:41 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH 0/5] staging: vt6655: `RFvWriteWakeProgSyn` variables rename
Date: Fri, 22 Oct 2021 10:37:13 +0100
Message-Id: <cover.1634826774.git.karolinadrobnik@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set is a preparation work for `RFvWriteWakeProgSyn`
refactoring. It includes removal of Hungarian notation in
local variables and function parameters and changing them
to use snake case.

Karolina Drobnik (5):
  staging: vt6655: Rename `ii` variable
  staging: vt6655: Rename `byInitCount` variable
  staging: vt6655: Rename `bySleepCount` variable
  staging: vt6655: Rename `uChannel` variable
  staging: vt6655: Rename `byRFType` variable

 drivers/staging/vt6655/rf.c | 60 ++++++++++++++++++-------------------
 drivers/staging/vt6655/rf.h |  2 +-
 2 files changed, 31 insertions(+), 31 deletions(-)

-- 
2.30.2

