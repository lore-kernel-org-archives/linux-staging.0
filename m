Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DC67B
	for <linux-staging@lists.linux.dev>; Sun,  5 Feb 2023 08:06:12 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id q19so8855046edd.2
        for <linux-staging@lists.linux.dev>; Sun, 05 Feb 2023 00:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cf43ZAC9d9vV87Brf749qwDNEbTSGBab1FS9DyewXkE=;
        b=IYzxAnFf7wdql5pNk1TmzsC9UPQ7Cwt72Sz7/xF0jPG2kf2CTMAE+6qsUjmcs75YFm
         gwYr9dCg+Fvih+BixjfsA69bk5FMag3n88eqUg/QxrcTvHs1Jt8tAtuc37Ln3pk0Wg1d
         ZPkoP1Ft5Y9Q501jx7BOlqX9ZJjxGkGK3t2hxnG4rql05HsfbWRumyn0MFlbongnY4eF
         gs6FtfWbF7y1MU8jOx72EQGG59RdV0oin6Tq5Esh3jMk9z6a6rit4qFE1MFpftq1XKIb
         xO8RDtbygHZ16oLbLGgtCFUM5uzIVHq33VqfHFVGjwEZ70GQcIr8z5NInXZg2TZ9aZUw
         pBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cf43ZAC9d9vV87Brf749qwDNEbTSGBab1FS9DyewXkE=;
        b=mP8wqoqu9+jFzcIgX8ARvbrjAAqDR5tq9MKpL9HnU6bucj0NNrwiq8rvv7UpgfBcE1
         W/323gKqBQee3Hwr1Zc3s7hdq3JHDh7keR2TErxcHOVBFiDiZLqKKWwWMaRZ63z+SU4H
         pa63hj4VcV1jLk5ijt+kHrzRUSSHwPlrKvuGo5qfvJm1lQYfFAzDtEks9IeDg6DXPklM
         IvA5x7SuJM3iOjPapz/AM+KiKCg4yYjxn+WTX95YN1e2OS8sJcQ62rJkzLaNT5W5LwqA
         NWGezH6EhxPraK8FeeqFpGPjdij1y1YlSsfPaUUbTUDoixbZ+38AnX7FysRXKxK9GWXQ
         KNJA==
X-Gm-Message-State: AO0yUKUGhyRAX7MOxUN+j/AOnnmBHaQ8KQgA/7dBnM4W/3sIvK2hO20H
	Jo8/PkXk5XKv0L6I5g11m00=
X-Google-Smtp-Source: AK7set+lpuCEhSj4zOH3rTqwYf9bgUaGTOBRuaqkByOp1hB9QuOm75UJDzH5A4fNA1RTxwUlLfXXfQ==
X-Received: by 2002:a05:6402:2206:b0:4a2:1b97:228c with SMTP id cq6-20020a056402220600b004a21b97228cmr13979648edb.28.1675584370914;
        Sun, 05 Feb 2023 00:06:10 -0800 (PST)
Received: from localhost.localdomain (ip5f5abbf9.dynamic.kabel-deutschland.de. [95.90.187.249])
        by smtp.gmail.com with ESMTPSA id q10-20020a056402518a00b00463bc1ddc76sm3441379edd.28.2023.02.05.00.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 00:06:10 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 0/2] staging: r8188eu: correct error logic of two functions
Date: Sun,  5 Feb 2023 09:05:57 +0100
Message-Id: <20230205080559.8319-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series converts two functions away from returning _SUCCESS and
_FAIL. Another tiny step to get rid of _FAIL / _SUCCESS someday.

Tested on x86_64 with Inter-Tech DMG 02.

v2:
Removed the initialization of the variable err in _rtw_init_recv_priv()
since it's not needed.

Michael Straube (2):
  staging: r8188eu: correct error logic of rtl8188eu_init_recv_priv()
  staging: r8188eu: correct error logic of _rtw_init_recv_priv()

 drivers/staging/r8188eu/core/rtw_recv.c   | 30 +++++++++--------------
 drivers/staging/r8188eu/os_dep/os_intfs.c |  2 +-
 2 files changed, 12 insertions(+), 20 deletions(-)

-- 
2.39.1

