Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E62A1E9F6;
	Tue,  1 Nov 2022 18:17:59 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id a15so22109490ljb.7;
        Tue, 01 Nov 2022 11:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=19Xxsc9yxQk7AdY/KcLWGJoR0iY+GZN806fyiNbs/DQ=;
        b=qYgXgt0uWuPo0bMR3BYGYeXINK+f7aQU3fqeU9fMZiGuBOPp3VlJLPFP2yQod+17Gu
         zkOB4LQrKTTE2ZYaIjn9CDohWZ1/LtwzogE0CgJ6Kl7ZJLtSxDnsGMKrd83z/hwEpqQf
         VnhVZosM/EWl2w5fnO96frfoYySmGQ5An0fDAibmZxsSdY672Ka+tBB4DinVnA0NqZq1
         HyNCP4tCJfZbF/JB5m0BxmyGLsuj+fAjUk/rhT3nljRLk4y3e1YLkDBaOMdLlPA8RGBD
         dAZnGIG9/eb0fJ7N2feTHg7p32V5BgD6Bb1hVrznlOzuG+j0/s5LTjtX23fzHBF9LrAq
         C47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19Xxsc9yxQk7AdY/KcLWGJoR0iY+GZN806fyiNbs/DQ=;
        b=ljmujEzq5xD4kIq/5GxUGdDFZCSrniP2XTqAdyy8nfKjltDwvRoIY/5TZQjRMXcTUc
         Z+OFw2GhdnGkoMBf/KJkamFv+3WA7OXfZq5nTVgTzV5gDxBXP+74Vk02OOTGpzWqkb06
         puhndQdaKec86GB1ap9amg7ZNjMB82X7iRwhAs1eckQhoIxoTm38wLoYMCdhDzSWRn2F
         eZAwRaIdYtwJCk0X55A7KRf6naMZBn11u7P5AgzsAE+pNFLAwC3FF7GJ4stv+mV9M5w1
         VDbUqEU5PQ8hySDjIgJVWaqj/eb9JPvWd9mRSB4rV69/Ydnpa9y7GYkdWMkWHPDH6hI2
         mYzQ==
X-Gm-Message-State: ACrzQf1/6jSZ37ynfPKFVBNdfjVhz4WtTE4fEGEMTGMwnfZQsCIcwYAN
	QX06UAw+nJ3znP2llDqI1iI=
X-Google-Smtp-Source: AMsMyM6LSPuRGyQoKi0EZ7AmX7s0fTDkbx/DgMxTG7eBZCESlkkWiVIWGIXv1jy1MwsYAEZdPMVQ5Q==
X-Received: by 2002:a2e:4802:0:b0:277:54e2:48b8 with SMTP id v2-20020a2e4802000000b0027754e248b8mr4905244lja.44.1667326677477;
        Tue, 01 Nov 2022 11:17:57 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id 190-20020a2e05c7000000b0026f9cb6d10fsm1850601ljf.45.2022.11.01.11.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 11:17:57 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v3 0/2] staging: vt6655: some checkpatch fixes in the file rxtx.c
Date: Tue,  1 Nov 2022 18:17:47 +0000
Message-Id: <cover.1667326000.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These fixes are focused on the function s_vFillRTSHead

v3: changed the function name from fill_rts_head to fill_rts_header as
head is conventionally used in lists

v2: changed confusing changelog messages

Tanjuate Brunostar (2):
  staging: vt6655: change the function name s_vFillRTSHead
  staging: vt6655: Join some lines of code to avoid code lines ending in
    (

 drivers/staging/vt6655/rxtx.c | 48 ++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 26 deletions(-)

-- 
2.34.1

