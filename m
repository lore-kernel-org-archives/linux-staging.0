Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD0114AB8
	for <linux-staging@lists.linux.dev>; Wed, 10 May 2023 15:08:55 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-643557840e4so7925334b3a.2
        for <linux-staging@lists.linux.dev>; Wed, 10 May 2023 08:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683731334; x=1686323334;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ISNEZENIG6K3IyfhajA3k/qhhHWtHVV6rKzQTcXTN74=;
        b=eSNGpnZob1N6NvKSRItpN5FKrkUL3QRuF2vJVxZAvSr0qq6KO077KassFOMkOVrQ8e
         ffrirAM5v461+Urxohi5sOtjnGAIaA+Jy90m4AfWgTlkmG86W/D6kJqn8Nikg+DR9RfY
         4CrrN8+mCYGWuvxKinSzkB66Um3HYsbDROl2n1PsU//deaojS6WQs647/oS1rCOERRvj
         EMkArPQLd5jF9u+Q5Qo7UW7GCojGaTOXqMe8Tc5WGg/fF7u7EhlID98APoQ/slvnzOT/
         oCpGaHETsvWcZp5pyMnRuSeX7gS7X77XlekN94Z7xXt0O8DXImVYH/QmlKK5SDBjQWL3
         LAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683731334; x=1686323334;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ISNEZENIG6K3IyfhajA3k/qhhHWtHVV6rKzQTcXTN74=;
        b=NHfPbTTWR9A5efTVlhRS/Ak7IACD2nhuVvI35BcrhKBIw2Cua8p/SmYodHVlbwBe+w
         01UiRYShjKMEyjXRIA9xezEMIqBXkdNAp8qqUwS2jngZtOOAcmtXk1D4dKQZrpa2LOim
         CeFkDDy0MlLf5mhYnzwxYZCtiKgcAlaTUcosDChxIQ8IAR8rMXWD5Gqj6GaPeaCrFkvG
         mcV2ZbfmFLKPbK55LvTmIos3QKGFIFK38K7++47RP+Ns72gh/bOmsekq6EPx4yg1oZqR
         ShqAoA/RI9zojckBE5sjS7/LIzutJzAjt/xAZo6BTZ9pSvByZifTacre58M7fQ+41/F6
         lGiw==
X-Gm-Message-State: AC+VfDyim2KE92QVn0PH8SesJI9CxDLthgKn57QmntEgaUojQep81Aq1
	GNJ8g79wkG40wnLBITv7+Og=
X-Google-Smtp-Source: ACHHUZ5OKb+xGZ0+LVt5TlLyoXHbLdDwHqsFFp5uVw69JE4irlr+jT+179PZOynhNCkE4by/dJrfmA==
X-Received: by 2002:a05:6a00:1acf:b0:643:d40c:7da0 with SMTP id f15-20020a056a001acf00b00643d40c7da0mr18027552pfv.31.1683731334516;
        Wed, 10 May 2023 08:08:54 -0700 (PDT)
Received: from pop-os.localdomain ([103.251.210.208])
        by smtp.gmail.com with ESMTPSA id j11-20020a62e90b000000b00571cdbd0771sm3636931pfh.102.2023.05.10.08.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 08:08:53 -0700 (PDT)
Date: Wed, 10 May 2023 20:38:49 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] staging: rtl8192e: Trivial code cleanup patches
Message-ID: <cover.1683730854.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename variables in function _rtl92e_dm_tx_power_tracking_cb_thermal
and Refactor variable assignment to avoid checkpatch complains.
The patches are required to be applied in sequence.

Yogesh Hegde (4):
  staging: rtl8192e: Rename tmpRegA and TempCCk
  staging: rtl8192e: Rename tmpOFDMindex and tmpCCKindex
  staging: rtl8192e: Rename tmpCCK20Mindex and tmpCCK40Mindex
  staging: rtl8192e: Refactor tmp_ofdm_index variable assignment

 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 68 +++++++++++-----------
 1 file changed, 34 insertions(+), 34 deletions(-)

-- 
2.34.1

