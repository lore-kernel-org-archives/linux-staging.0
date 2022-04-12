Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C88468D;
	Tue, 12 Apr 2022 01:50:28 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id j21so18235919qta.0;
        Mon, 11 Apr 2022 18:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jKyWVi0ve7aKsv/+aHfSEOINGe3jcF/vd8+tINhOMZE=;
        b=QSsOvOnZkV+2M7zbq6OC+bRcWNQYZT2UUt8v3cmf02LOAKcNqBgAxrIRUNKeSEEAoJ
         +wkEwO9wPlI6eJxxuzjKsaFYJtRrc99bkvNGGomxrGn4UoUTUCULgo/AGkPjjEXYDJoE
         EcBxoVBW5evfOEk/RGaPLtfxvAoRKdrq/3EpLOO8ukA6LEJJHuvUZEQRm+mlOEQeXCQD
         iK3mNjqrLYLOwOQCTNvnpfOhC9kMF6+XutcRcTY/YfWwJk4KxB6aZj0cvPLpKu+sUIdR
         Vz6j70xm/ZSrtGbR13um/c81eKjYHWveTjTATbAfg5/4lj75Oqwztj8PKRB5V1kZVfHZ
         28Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jKyWVi0ve7aKsv/+aHfSEOINGe3jcF/vd8+tINhOMZE=;
        b=vSf5rSQavsUztKOqub7vaCZQaz+17bK3QEmx0AHCw0NHUQRGrB1D7fwXGH+DeTojl6
         8z60yHGOdeNJiTPpTEw5QJniC598/btoPJhywulHvDQ/vgKmufLT958qfBw/EL1csOPf
         EAp9T5IslT84rwPG6Dr4qmcKvaz0alZ6FAw/rsjido0GwtkHMz4+VB1seLC9Bqd1YQuI
         5s8fMrJnHX/rms7iMuQTWGRok4vMwcYHYloAynlFENn7WjK8vO0eWqWKM7RQHJQsXIrG
         bZFDeCScWIseXvtFrRnkVfUmJ/2ZL+XeO6YXhDgf/wF7vK/gE2b9u+HCtDVnzIDwv6Nn
         p0IQ==
X-Gm-Message-State: AOAM532L6O2r1HLZiRXfWD1/jG5HwfiHiWtChgO3BSRCLParatZ0yNxA
	Jkhidqp6kWNy2K5+vyVLBFNdtZxXmGgbEOVf
X-Google-Smtp-Source: ABdhPJyEBMG97k4uEqBba5YXTdlj8fzZQ3go4vS1Au7uKyxdEVudkrcxMTbLa+Z0kDXvPaie3BSAfQ==
X-Received: by 2002:a05:622a:4014:b0:2ed:eb1:e12 with SMTP id cf20-20020a05622a401400b002ed0eb10e12mr1643843qtb.421.1649728227741;
        Mon, 11 Apr 2022 18:50:27 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.lan ([2607:fb90:50fb:900e:25ab:983d:ac30:58b5])
        by smtp.gmail.com with ESMTPSA id s16-20020ac85cd0000000b002e1ed82f1e5sm29556305qta.75.2022.04.11.18.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 18:50:27 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: johan@kernel.org
Cc: elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com
Subject: [PATCH 0/2] staging: greybus: fix warnings reported by checkpatch
Date: Mon, 11 Apr 2022 21:50:20 -0400
Message-Id: <cover.1649712572.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first patch corrects a typo in a comment. The second patch fixes 
'void function return statements are not generally useful' warning.

Jaehee Park (2):
  staging: greybus: correct typo in comment 'Atleast' to 'At least'
  staging: greybus: remove return in an empty void function

 drivers/staging/greybus/arche-apb-ctrl.c | 2 +-
 drivers/staging/greybus/audio_codec.c    | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

-- 
2.25.1

