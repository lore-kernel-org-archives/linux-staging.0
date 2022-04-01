Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9613B7C;
	Fri,  1 Apr 2022 19:07:07 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id z19so2985377qtw.2;
        Fri, 01 Apr 2022 12:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7sCg00QwNMKVUFlzQkj2jwwa0uYhEC8jL1U6rlvYrSo=;
        b=klBxS0IuRANL9EkV0AlTz7LfzK2HCEuB8787h4LJqwiiafZvZ1IoFlcrBBD3IzOlfe
         +KxC7PFfqALM13UDk0nBznmlKk3pLKttxxohCRaOnT+FqLK86EKdXlhuOEpC9I1F0ISx
         BNtFO5r+FOz/4S5IQ3SvA54Kj8dNpiMGM7Iuy6gfYgiVhrMeE6s3qoHzYV8E+DWDuqcI
         4HAm9W3hYNvVk1rBMy7x6Mdz1Mqq5mFWgesqFnKPDSk5cd6pX8UFOUWkwImJgHgW3aXc
         WFC54LPQGB54yujmOs9Tv4RgCFHNR+pY30y3w1L7/93sHUOdDMCMSEbDwXnVS8HSQAyB
         HDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7sCg00QwNMKVUFlzQkj2jwwa0uYhEC8jL1U6rlvYrSo=;
        b=XwDhkNQeJEDxLEfzy33ebAcHpJOB5sI/2buQeUuw9yQH+VMBhEngR1cQaJ/FfRvc/N
         0ZW2nM4dkXMDwIgP2E/ienpqJONpCi6Rm/hlnJXqYs3AH7mzs9mqRra9rMS68mY+bXMJ
         9sJQ/d0AkjsCYNSHZOEh+WZeLRr6tl89GV9zIH+Il4iDn0ChMV6ky1SKfSr67HUSvGyJ
         wZvzJfLWDlrQzd5N7kxIMylZUKfoxZS/rNdTZJrtMHRIZ6NDZYCqv48lYtRrMYoY8RiB
         1YJhzzibdYve6i661A+KirgZxcgO6aDjE3C9r03U4av9wL4rf9m9/DamnFEhdxy66Uka
         qLmg==
X-Gm-Message-State: AOAM532wEsx64lcAs7PYpJcnPXJYsPjlfROPWX71vwy9eO/jLbM587uS
	Gq2F1DR68EdC/yxU/x0xPBZfbtOvxGOK/zhj
X-Google-Smtp-Source: ABdhPJwpO0qbLyMdD6SzmDXNla4KlXsoLvFGbpLE5RJEEM73tH2inLiDjeKeBTv3EfGrih8xy0EzHQ==
X-Received: by 2002:ac8:5855:0:b0:2eb:87af:ab50 with SMTP id h21-20020ac85855000000b002eb87afab50mr9628284qth.406.1648840026397;
        Fri, 01 Apr 2022 12:07:06 -0700 (PDT)
Received: from euclid ([71.58.109.160])
        by smtp.gmail.com with ESMTPSA id r11-20020ae9d60b000000b0067e5308d664sm1797765qkk.92.2022.04.01.12.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 12:07:05 -0700 (PDT)
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Subject: [PATCH v2 0/3] rlt8723bs cleanup
Date: Fri,  1 Apr 2022 15:06:55 -0400
Message-Id: <cover.1648839305.git.sevinj.aghayeva@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches fix three categories of checkpatch warnings (redundant
braces, redundant else branches after return/break, and constant
placements on tests) in file rtw_mlme_ext.c, which is part of the
rtl8723bs driver. False positives, such as

if (foo) {
	/* TODO: ... */
}

were not altered.

---
v1 -> v2: Removing a redundant else branch left a variable declaration
mixed with code, which was caught by the kernel test bot. Move the
declaration to the beginning of a function.
---

Sevinj Aghayeva (3):
  staging: rtl8723bs: remove redundant braces in if statements
  staging: rtl8723bs: place constants on the right side of tests
  staging: rtl8723bs: remove redundant else branches

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 167 ++++++++----------
 1 file changed, 70 insertions(+), 97 deletions(-)

-- 
2.25.1

