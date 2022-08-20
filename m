Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D6B610D
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 06:43:26 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id x21so7934436edd.3
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 23:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=RU3vYRLuQKxt8Hd9Yyqo+KAgZMxn2BTVCKejZHVAHN4=;
        b=m4g38oHu9ymHfkRcDWWXCQl6ixV1MIgEGjOhX2J3UVxDJJbt3clFcGElWf9db1K4BG
         YjuRSCYTTPdDJTCBKY9sR4KUBiLA18t/WWndtYvSFv3+plqk6DLhC4j3V8TxlAkD2eJm
         cW7LG0GsC5KOr+BQIHBTDuPMLb0aNcdQqat+tWDaLC8pGXQjBIEvIOUjEViNFK8yJEs0
         FBo3mZxVASDaISqAJSU18RNEATql6+WWyRoVXdqFHXwPa9lUIEYAr+nJc4ck9qysTjIl
         gAuWIY8VAMkLPAqkWjwle8RQFmR4iOqWdv/3E18E74gBU5FsTHn5cq5bbTZ/Iqc9Colv
         uwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=RU3vYRLuQKxt8Hd9Yyqo+KAgZMxn2BTVCKejZHVAHN4=;
        b=aDtgQruuY8KZovLmRapc8h4ZlBHa25wJTqJbQ27/HOJWDiApfc0v2mG5t4u+c9CVdm
         r1lTt7X6Z/Ru1IZ8miEPcyOOlOEgNTLWwbhcJiymt7EihTCQLMwcXJs2CH/ounDApjuP
         3xsnx2s6etaPkyKj/OMp30Sdo3i/a+ZWrIJznH6COOFvFzVS+qylnGHgXUAiplX/JFWr
         KBqwT8iYSF5HGqA6L/oECfhhM1+lCCgN2cOlLIgnY7PCLQJtciABUaOLQA2YCse/ZRQ/
         Whyserr4NjW6qksE76y7TjFNkyv8FH8o2/SBLVsWYxHGKK3frFpZb7o02p16/3AOn7uB
         3l9A==
X-Gm-Message-State: ACgBeo0zrhqGrN3hf2etamiRKCo7xWiPB4qjvxEfvSgj5Oay4CYq5Hvz
	r+zp2gudX8KvmMwjhFzFM6Q=
X-Google-Smtp-Source: AA6agR5RWErpONMzRQx8HXnACUqvwGadFt8Q5XrvObDaNqoCqCPunWpBvAJ942fOSHW0zg6Qmh21PQ==
X-Received: by 2002:aa7:c956:0:b0:43b:206d:c283 with SMTP id h22-20020aa7c956000000b0043b206dc283mr4142574edt.381.1660977805089;
        Fri, 19 Aug 2022 23:43:25 -0700 (PDT)
Received: from nam-dell.vm.stuba.sk ([147.175.88.220])
        by smtp.gmail.com with ESMTPSA id 27-20020a170906329b00b0073c0b87ba34sm2935816ejw.198.2022.08.19.23.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 23:43:24 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: lkp@intel.com
Cc: Larry.Finger@lwfinger.net,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	namcaov@gmail.com
Subject: [PATCH v2 0/4] remove useless files
Date: Sat, 20 Aug 2022 08:42:42 +0200
Message-Id: <cover.1660977535.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202208200447.kdEhBy9a-lkp@intel.com>
References: <202208200447.kdEhBy9a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delete odm_NoiseMonitor.c and odm_NoiseMonitor.h because they are
useless. The first 2 commits are preparation, and the final commit is
actual removal.

v2: Add new patch to remove the file from Makefile, otherwise there is
build error as reported by kernel test bot.

Nam Cao (4):
  staging: rtl8723bs: remove unused function ODM_InbandNoise_Monitor
  staging: rtl8723bs: remove member noise_level from struct dm_odm_t
  staging: rtl8723bs: remove odm_NoiseMonitor.o from Makefile
  staging: rtl8723bs: remove odm_NoiseMonitor.h and odm_NoiseMonitor.c

 drivers/staging/rtl8723bs/Makefile            |   1 -
 drivers/staging/rtl8723bs/hal/odm.h           |   2 -
 .../staging/rtl8723bs/hal/odm_NoiseMonitor.c  | 130 ------------------
 .../staging/rtl8723bs/hal/odm_NoiseMonitor.h  |  39 ------
 drivers/staging/rtl8723bs/hal/odm_precomp.h   |   1 -
 5 files changed, 173 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c
 delete mode 100644 drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.h

-- 
2.25.1

