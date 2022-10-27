Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C071865;
	Thu, 27 Oct 2022 09:06:00 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id be13so1467740lfb.4;
        Thu, 27 Oct 2022 02:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pb7xGr5fuIL0NtgblTv6xk3hHUrL7glkJIQ1IQxfKe0=;
        b=jLSWcMzrSk/mqEfzXQZjeid0ZwoWYAz1FTuDTp+7XVyQaSLobdU/+LjtKZMk+LSI++
         U95kA/OZrU6OBs9TKnAUQwXCQ27GFtbkfB3+m8WW9PLT5CC7+lh5cNwZvkIztGwgIoSO
         AQ9QVAQEwNvyiE4ez3Q85GI7CyJF/4w4SldN4by45idAz1Y6Ll94tb1QLZn7W0AAdGmq
         S1zfIfidXOsQHq4pNbmweXVSeaSt3VdFos7Oo+Z0ljVzawpeq6Jg0YNrEabxmFqomM+V
         3N1WMSOQ096/F0Pm5Pcob8lclKu1Kqae9MqbZNRhm6i8KdNn/m4YMwD/E5vWytYqqvQs
         dzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pb7xGr5fuIL0NtgblTv6xk3hHUrL7glkJIQ1IQxfKe0=;
        b=EncBZflOzlAbtZz9W5qVyl68ny3FzPqckRhqwc0CMzgQR/O4wumsuuoc34ESsGTNdn
         40A3YK+XA973mk4Md0paWJ1WYdSHBcxxrRA7H1EI5lRBcv15rgLb953kMj1iu+2uZQmB
         CY52/FM2qTISMR838L/Vsh6X4G6DCYW4KPvg7hMtq0wUN3nqACx+sJE/EFj7yzCQvLAW
         ees8G7YNsn3imphE6I6Lj+ck34XTImvmWXNWjbaiqcc61OkOLTSerfWRwxsyS/D6bT0n
         TbCeekp9ivdBX7Qy2wAi+QLUSInhFFMvKUwKflwpqLdf24vsJRH1k1+so8yidIPIGs9e
         IAlw==
X-Gm-Message-State: ACrzQf1Cx1zOzR6lCExeWxjRCObk5j29YPpfccNgUFde/fT3peCn5Ez4
	JCUUlLqWEl7ikg9ma6RJ1XY=
X-Google-Smtp-Source: AMsMyM7N6TxNy+/Mr3NYgX7nR3Jit1vP2BXCodMzldTEl/RHwqQFdCcWjnzzPthI6c6QO14DHKMwIg==
X-Received: by 2002:a05:6512:2a98:b0:4a2:d66f:c57c with SMTP id dt24-20020a0565122a9800b004a2d66fc57cmr17088367lfb.506.1666861559033;
        Thu, 27 Oct 2022 02:05:59 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id d9-20020a2e96c9000000b0026f9cb6d10fsm153273ljj.45.2022.10.27.02.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 02:05:58 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v5 0/6] staging: vt6655: a series of checkpatch fixes on the file: rxtx.c
Date: Thu, 27 Oct 2022 09:05:49 +0000
Message-ID: <cover.1666849707.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <20221027090549.DBxKy-2e6DU9fBnyStoVrx7LwLSIyErrXKFV60kr1I4@z>

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

