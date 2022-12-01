Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B93EC4
	for <linux-staging@lists.linux.dev>; Thu,  1 Dec 2022 05:38:55 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id p24so645974plw.1
        for <linux-staging@lists.linux.dev>; Wed, 30 Nov 2022 21:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oregonstate-edu.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6WVt3V8FfzgzDnwBUBeRhDNHIa04Em5O1M/U9tgg5G8=;
        b=UZbwdtUWMNFeUxioVu4QDNsPbO8DSdnMoVXOsgd0iHeEuEuFV8fpDxJWYUUTYW3Cum
         mQ/C1mwhZ1gVlBfO+p9rvuwsJvv0RK/xhgyFvdYftENEDpHchxWLcXvcvt8y/3eCD0f9
         ifjVcRL5+rtGcYF/mj2B5DQ9ehVPbUA+FZL1cieacsV4rTL5udChLTPbY/RAbb2vqtbt
         uEAYKnnAI/iJ95RcF9XgdN0iNq+w5eJxda5MFY77HC9S1b1d7e0cVUiynKUA0CIvJtzV
         TXyaK557tzrDhaDNY80InxkqYmixwqaWPDaH4/5WY+qB20/33Ymo5zjqeHEx4uZthRlJ
         +Pxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6WVt3V8FfzgzDnwBUBeRhDNHIa04Em5O1M/U9tgg5G8=;
        b=JhZGiy0gPM0SYCRJlg7P0ICa4t1rJ+Dp2mAqFcfH/6vjF9i3ty+sfoj+tnjHJ+MXRr
         vBtSszGrkW5HjFZLYbMgtqYhtLIKGisidDbzik5EcHPIb3Yp6nvUBm4FTv27D19R1wGb
         pcmyUUUQVKn9czlu7/Zz62Mw++9+n+3Tttd7mpd1CA8xJ5SEuNV9RZfXAow7hdrvpATS
         cUBTpnisRbgs/xi/cp94lvy0SNJZN0j9Yx2QfY12B9JPR9pEtv0m8VUSBAsj7xz/DQN2
         QcTolxF/qUAIsNKk+ko5lt84FbfZEJ6NdAaA4YIWoAZYgcLe/CwzUE6IZvoNqF6d++3I
         7jcg==
X-Gm-Message-State: ANoB5pkx0oD+fF1tgZkyVpcUzhDU5TrxlMeoYpzU5egXfEFRp5zPul4N
	G9y9EZ2H0xISRHNE/0aYF+OoJA==
X-Google-Smtp-Source: AA0mqf6EfHKL1F+S6GRgY8Ae0oeN5XfbYeVhUMkna1iH4YadKpdm3eH+pjdUkSrigvzfsFumjoaD9Q==
X-Received: by 2002:a17:902:f7cb:b0:189:3e8f:fa49 with SMTP id h11-20020a170902f7cb00b001893e8ffa49mr41209551plw.142.1669873135441;
        Wed, 30 Nov 2022 21:38:55 -0800 (PST)
Received: from ubu ([76.27.231.73])
        by smtp.gmail.com with ESMTPSA id t197-20020a635fce000000b00476e84c3530sm1754319pgb.60.2022.11.30.21.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 21:38:55 -0800 (PST)
From: Jack Schofield <schofija@oregonstate.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jack Schofield <schofija@oregonstate.edu>
Subject: [PATCH 0/3] staging: greybus: Cleanups in loopback_test
Date: Wed, 30 Nov 2022 21:38:49 -0800
Message-Id: <cover.1669872193.git.schofija@oregonstate.edu>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct issues found by checkpatch.

Jack Schofield (3):
  staging: greybus: loopback_test: Add blank line after declaration.
  staging: greybus: loopback_test: Remove void function return statement
  staging: greybus: loopback_test: Remove extra blank lines

 drivers/staging/greybus/tools/loopback_test.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)


base-commit: 9dadff066244543780e5d9ee406b3ec7af19e22c
-- 
2.25.1

