Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C959C7B;
	Thu, 27 Oct 2022 06:01:40 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id bp15so671527lfb.13;
        Wed, 26 Oct 2022 23:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pb7xGr5fuIL0NtgblTv6xk3hHUrL7glkJIQ1IQxfKe0=;
        b=B2FHC86YAHuUPEPnk72ooTJ6542hsi9NToF8YQGLWNSWfWJTu0H+QxT50J5t0vfG+C
         aKwjSJYOa0+GIEXLvwbeEKTDJnltdlF5AYfc/E6GCoFZx/IvllRqJZ9Sgpk+sRWjBGl+
         9xrDeRuu3ZdRgthgB7eOYwfU1kZYVjzaReKx0faJaTMGd1OPwsumlnk/sbFZjUhDKjcI
         EWZ+KgUfJQQXMAAeJZy//IDeV8NlcOpFnHc/OuzETfFd7otDCCOlLWYBGfK09qR9BaFE
         gah06LcZJmFayxkfGWN+0WSjS7nEq8t8T032EaruhwZanl0aQ+EYHvl6EG7npFpoW0Ir
         lceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pb7xGr5fuIL0NtgblTv6xk3hHUrL7glkJIQ1IQxfKe0=;
        b=I0QcFfOByI/Hexi15K+ljXMNVsF85KuPEggKD/gjSOwq/z8Cie7CddwbrvvyM8k7dx
         9IqrbESyha1Cfr27PEvU+8vhvfu4NR+PZfw8T+yt8q9pdHsw3ES3aytLh3FYBbsFb7RB
         2jAMVgoqRqq4mJ8OSJg2Ygof9p30+7uDey+kNUFdWTSW0JTVOwHIavCFD6jddLqhCd3r
         PgToZkBNYQsTvJEhsYGq3yjS8nVlPinl1GvTSnUbjGdqf7FhbEJJs3qJUubP5WZjtYkH
         aj3gakxMp+BplsP/BAkDF8r+53pibuVFVJ/id35bAY8M8pXWwpkrGZU18RdYvb4CdW5N
         y9cQ==
X-Gm-Message-State: ACrzQf22QXpNP/il2VNbmRRvOMhyB4KOQ8toVDDitZ/6SfSoBhelTAZD
	kekuasY2n6pyFr1IjG9cJ80=
X-Google-Smtp-Source: AMsMyM6jL5UsUwxEgYclp9Exq7z/A9Gr+3ib1fHe0h2dM+tzH8NG0E1r0eMO6rm5UPzWF6oNE77wvw==
X-Received: by 2002:ac2:50da:0:b0:4a2:44dc:b820 with SMTP id h26-20020ac250da000000b004a244dcb820mr18045843lfm.316.1666850498631;
        Wed, 26 Oct 2022 23:01:38 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id j3-20020a056512344300b0049fff3f645esm61537lfr.70.2022.10.26.23.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 23:01:38 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v5 0/6] staging: vt6655: a series of checkpatch fixes on the file: rxtx.c
Date: Thu, 27 Oct 2022 06:01:24 +0000
Message-Id: <cover.1666849707.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fixes are similar, mostly long lines splitting. I had to make
serveral patches to ease the work of inspectors

v2: fixed a compilation error found by the kernel test robot and
recompiled the code

v3: tends out the error persisted in the second version. this version is
a correction of that

v4: did some corrections as recommended by Greg KH

v5: shortend changelog comments as recommended by Greg KH

Tanjuate Brunostar (6):
  staging: vt6655: fix lines ending in a '('
  staging: vt6655: refactor code in s_uGetRTSCTSDuration
  staging: vt6655: refactor code in s_uFillDataHead
  staging: vt6655: refactor code in s_vGenerateTxParamete
  staging: vt6655: refactor code in the rest of the file
  staging: vt6655: refactor code to avoid a line ending in '('

 drivers/staging/vt6655/rxtx.c | 542 ++++++++++++++++++++--------------
 1 file changed, 324 insertions(+), 218 deletions(-)

-- 
2.34.1

