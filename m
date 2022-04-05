Received: from mail-oa1-f66.google.com (mail-oa1-f66.google.com [209.85.160.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3DF15A8;
	Tue,  5 Apr 2022 01:10:51 +0000 (UTC)
Received: by mail-oa1-f66.google.com with SMTP id 586e51a60fabf-df0940c4eeso12818955fac.8;
        Mon, 04 Apr 2022 18:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VWQUbrOoxwmYB9P20ebLb/ZcAUVjBSaCgXPVioGRjas=;
        b=CdxPyPtRsQI/ntlcqty+gtnhuGMgiR7GNZNYORSTfB8oyttAskvRfIPJte2S68/aId
         kBJgOIbwWAIwfYHwvrFjMc+9tORlpgSkmBLgiKiOyHqkNLllo/3syT1M9esqosWn+TZG
         5qInbalMfrcpR1GA8o5jR6wlkDOEEGKrG+EKfdwf2JSENsYSXGniYsXuoeP7ANXynrv1
         FioX+4H2NiQ8HriinLwqzAWM/yfCmAzrMtpiliqXVKi/Rl2J3s90GbHTDRz3C5VzkiJz
         UxTF0ULgLfKihJSkJl6KpYztEHx1RhDz/NRzYRCYrJ+U6Nmc/4qucl01xKrFwwiLTZhM
         iJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VWQUbrOoxwmYB9P20ebLb/ZcAUVjBSaCgXPVioGRjas=;
        b=leyHxfOxOmrGGatW1MmfeLI20u2k++3XF2+Ij2SsiBsCcRH1LziKi3RJtkO9ldVJmR
         ++rnqAKDWknUq5Mmvou0lUR3XrrHQ1Lw9V0fNR8in+v+bZqc8H1ZMOXEvCaqmcfRtRiA
         oTh4Z0rf8SANpEMBJdqBOUgkkHQA83oh+78TiovFOPdLdwwWiL5r4vtRJT+XEzFJHuMj
         jI1bj37qeIWAAy3vq7Vta1VKG/xgKsjmvSybircdq2FEDz21wexCZc/54NrK41lLPCKQ
         tpEFZEjAjhLAIS+O9cMq2qCAuKTEiRdnEHhmP9YdVuTK8CnFkFOYGWhlIvoAmEUMGbuF
         KKSQ==
X-Gm-Message-State: AOAM53399MDCj4ba1AqZSTRUUGBvkFaUR3tTM/9vBymniEz2FxGlwVqG
	LTEsG2NNChUPr1MWycZb4Lg=
X-Google-Smtp-Source: ABdhPJxcMNezG2Fs58i+G61lJGk2QRFQEXlhF9qXgjmBY8ZPaxWu1kvZpTBfEcM+ikqzAlk3Td6Ulg==
X-Received: by 2002:a05:6870:5690:b0:e1:ef0c:271f with SMTP id p16-20020a056870569000b000e1ef0c271fmr533129oao.234.1649121050266;
        Mon, 04 Apr 2022 18:10:50 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id m15-20020a9d644f000000b005ce0a146bfcsm5075033otl.59.2022.04.04.18.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 18:10:49 -0700 (PDT)
From: Rebecca Mckeever <remckee0@gmail.com>
To: outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rebecca Mckeever <remckee0@gmail.com>
Subject: [PATCH 0/2] staging: rtl8723bs: clean up two *_cmd_callback() functions in rtw_cmd.c
Date: Mon,  4 Apr 2022 20:10:42 -0500
Message-Id: <cover.1649120568.git.remckee0@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches perform cleanup in functions 
rtw_survey_cmd_callback() and rtw_joinbss_cmd_callback().

Rebecca Mckeever (2):
  staging: rtl8723bs: remove handlerOS independent comment
  staging: rtl8723bs: combine both sides of conditional statement

 drivers/staging/rtl8723bs/core/rtw_cmd.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

-- 
2.32.0

