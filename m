Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAB77C;
	Sat, 22 Oct 2022 07:06:23 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id p8so8688626lfu.11;
        Sat, 22 Oct 2022 00:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CKp0vNQJo1Xjancyd+0lhoBs/j1rOPyn9CnjbmCY3h4=;
        b=N9jN1oR4Tl0T5jyg3x5iKJa8xLdEYKinhrjmzufnw2qDIQkR0IyFYM8zNzqDa0qehy
         0BAtdlc7B+C7OdpATs/zbuwdvmcSg4+Se6//Ew+twkb0zuZagLdT5l7440NWSHLuCFhU
         yn74RR+sEaZPXt63syylA0d7yl6WcuzRDs29/geUfEq62kgVDW3iyFYX/r188kmx+m/x
         v9p2h+DK460iYGJYdqxY+AJNFOcf0txZauXuaq7TFJmlLokNqbtudpL02sun7IJOAtLt
         ExT/wPX4TiEPhS11wmGO2vCuziIGdm6an4kBARMZay/R99V8COaSteWoZ4/Tu1/NR++5
         MyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CKp0vNQJo1Xjancyd+0lhoBs/j1rOPyn9CnjbmCY3h4=;
        b=oKUlFJO9mA5G35HilXt62B7L/ys3fsWr9sdR1fRxH2bz1kodblw1D1xexCyiimPJCZ
         0pZKNzpLT4cS4Us3ZbJvlk8TiNwreWnfPiODK7KII7OmTGa6+d1DFDXvg2P3mO+LR0r+
         fa6helFPGzWS6omo/M4lGebfB4/zcgswnUBqpigrWUx4W2/ETvQUR9e+tufksiY/8ZE2
         HdkhNvkCy6vtoYwHQ/TwfXW3XSkrSNYN8WttH3vWHLyTnXh7CFZSRASCcgIMSM//xRHC
         cZu4al5JT9EMiMuRrLJArsxJKmepUMQUmarn7FDYqg5pH4c5dwNru1LV4Vr93PLOgQof
         Xe9w==
X-Gm-Message-State: ACrzQf01rLjM8+fqOBmxG61NKdbE5GB22CQsquFCtiaJwe51BDKjyxMi
	z4wcplcDgf/yY4hfKHD1Kxs=
X-Google-Smtp-Source: AMsMyM5i8jcmTVSuJJsemiVoGPbJ4DVnYIne0FheNXPwydmvxdU908gexeN3q6ZPBOj0rv/rduiDYQ==
X-Received: by 2002:a05:6512:304e:b0:4a2:6c66:8355 with SMTP id b14-20020a056512304e00b004a26c668355mr9101117lfb.238.1666422381725;
        Sat, 22 Oct 2022 00:06:21 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id s5-20020a2e1505000000b00276d2537921sm390404ljd.59.2022.10.22.00.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Oct 2022 00:06:21 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v3 0/6] a series of checkpatch fixes on the file: rxtx.c
Date: Sat, 22 Oct 2022 07:06:06 +0000
Message-Id: <20221022070612.13009-1-tanjubrunostar0@gmail.com>
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

Tanjuate Brunostar (6):
  staging: vt6655: fix lines ending in a '('
  staging: vt6655: refactor long lines of code in s_uGetRTSCTSDuration
  staging: vt6655: refactor long lines of code in s_uFillDataHead
  staging: vt6655: refactor long lines of code in s_vGenerateTxParameter
  staging: vt6655: refactor long lines of code in the rest of the file
  staging: vt6655: refactor code to avoid a line ending in '('

 drivers/staging/vt6655/rxtx.c | 532 ++++++++++++++++++++--------------
 1 file changed, 321 insertions(+), 211 deletions(-)

-- 
2.34.1

