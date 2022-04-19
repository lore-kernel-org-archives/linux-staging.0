Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230DB1374;
	Tue, 19 Apr 2022 18:19:46 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id x20so13766501qvl.10;
        Tue, 19 Apr 2022 11:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fKMQkFvawID0CZV29rgaqxHAegUM/E6NxGk6DDsZkI8=;
        b=b9m9pXxzgZJeMtfo2Cug0ppaOJkm4czZvE9egRvfXA80ejbbVEM2YliZd2gb90pe4s
         YBMVpdlGLtygfzJmBl6Uui35l4cd3RoTHhJayr9Jz0XGKVQjHdj+VIyBnwQE0vlpflhD
         Sqr8qmt/p5Av2FmHHvQ+qMqQwHHIxXcdZaVAimgIUn3BvRU1QNt2zgPiPUJWpuH1hdLp
         dXwl1Et+jfP2BV99Dl37NfmABFH8q1Cew3szTjBXJlN0CpTFiwZWZdHCqNmqXLHH/++4
         lik4LA5dmp2QL+Ry0GYel+JjEBsFfsG1/VuOFT+renLK4a/IyHZjGyxS3rTvRqqx46k4
         yA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fKMQkFvawID0CZV29rgaqxHAegUM/E6NxGk6DDsZkI8=;
        b=SQeAMvEClCb+N7R3BkJUOA/KtTRus6J1aeMIdj5uzHqYjHH3UG6N+L3d8pyMuv4q+e
         goC/VlsQVibqfEc+q8dFzyp/XoYC+sS/947z3glOXh2Iihqz7uRV8VH/2NtXJEG9+lCD
         qhrlK7p8DQjcQTmNwGikk7ac52eWJmDC4bWPJCr+g7ZnF0X96O0G8uti4a6FWFJ4IOFq
         B0mASbJaOqhBn75vQEzUkNY+Aq781y43hTCNkhTkt1EDUkx7l23R6dE16OamRhDISDVX
         ApeJgMTCWM9mJAQcI3NThGwJv2Of9r7+TTrRwhWesl3Id22dT/jZMdqwpnQ+i4DijbMM
         9tVA==
X-Gm-Message-State: AOAM533+nSnO+F9dYUMjWvCRtQEihKDtTAIWQhYkM7nzLa7xafGlugpi
	qROH6jQdQ6Qc02mZ9Kjd/VA=
X-Google-Smtp-Source: ABdhPJwKjdLJQr8u8TDroFMFAbW0yrBrzevoiPmgWTe8N0+nUfmLQl1EPpkje/hetIESp0NGT6PGpQ==
X-Received: by 2002:ad4:4dca:0:b0:446:1674:4a89 with SMTP id cw10-20020ad44dca000000b0044616744a89mr12729173qvb.68.1650392385016;
        Tue, 19 Apr 2022 11:19:45 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.wework.com ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id e126-20020a376984000000b0069c86b28524sm373334qkc.19.2022.04.19.11.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 11:19:44 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com
Subject: [PATCH v3 0/7] staging: r8188eu: fix warnings reported by checkpatch
Date: Tue, 19 Apr 2022 14:19:31 -0400
Message-Id: <cover.1650392020.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches address style issues found by checkpatch in the
core/rtw_mlme.c file.

changes in v3:
- first patch that removes an unused member needed more removal of 
  unused variables. ubuf has been removed. 
- the log of the third patch has been edited.
- another small patch was added to remove un unused else condition.


Jaehee Park (7):
  staging: r8188eu: remove unused member free_bss_buf
  staging: r8188eu: remove spaces before tabs
  staging: r8188eu: remove 'added by' author comments
  staging: r8188eu: place constants on the right side of tests
  staging: r8188eu: replace spaces with tabs
  staging: r8188eu: correct typo in comments
  staging: r8188eu: remove unused else condition

 drivers/staging/r8188eu/include/rtw_mlme.h |  1 -
 drivers/staging/r8188eu/core/rtw_mlme.c    | 63 +++++++---------------
 2 files changed, 19 insertions(+), 45 deletions(-)

-- 
2.25.1

