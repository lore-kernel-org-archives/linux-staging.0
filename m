Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C5D7B;
	Thu, 20 Oct 2022 11:01:03 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id j23so25788424lji.8;
        Thu, 20 Oct 2022 04:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gyBUuslthV1iukz97HjUzwRbU5DGVBFIKN5W8BNvfbc=;
        b=KL9selRsjGQMqeAp735iVBdW5FfEC5WZ6RWYe7yFBHmxo5pyZdg0khgt+p3RoBGnXm
         OMwgaHe5r0beFOmWCG/+QrfAcLa2j7bBEwtVBYoXRlVfQ1O1msL7cvJ+xgrIlfdfa2NS
         EWdBsrIXdjr230NPeIkLDOU7kdzVI7DdlQbcpmtI1Z7hB46pk6m8pMLp7E5X5z/3R+VW
         tEmfZnfkitqRZdyFLY6xwziWxMFJBgwp1j3m1eley+7ryXTHUHvDluoDb6BgpDYwygBi
         eKiI95MdSWgXqgjzCQFBNvCoPp+n3NPHe+L8GhlPpQCuKvv0YxVGVhidc0VUuCFo1YnL
         YcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gyBUuslthV1iukz97HjUzwRbU5DGVBFIKN5W8BNvfbc=;
        b=ACt3/BSodjR2tX/4HMzs7Fp0zr1gZHZrlgpthCSbudAvsk2iss/HLpoZRZGGC+Cud6
         8TDcnZXaBV1ytLd523BYXIFMXap0EhApwoY7cR0QJFoaVhBJPrDxegdNmSK+dLM7U6p4
         OnX09LLHYtsnSB9Dt+5UrOJegSJ2tA13PpfEmdkwcw/Cp+Zo+PPjzNL0PXH6pdXJYNax
         0pPeL9Czjq3NaXh3Q47kaC2K/y7wekLgYHSL+AELQSbuvLCerLKaYr94cOVlXY2cWQnd
         OdR4Wvpawa4/2JNDf+ipLWsw59ZUcUKiS3Py8BnI4PZU5vaekTK2CyXecxCoCIB9EhUT
         ItZA==
X-Gm-Message-State: ACrzQf12m9xc/w5Co6C30nDSFD2GZivOw0vZ22yHX9SBj50eSKu8T9/1
	UrruGnBCiWAd1USxK7HQupP45E5FkkESI8eQ
X-Google-Smtp-Source: AMsMyM4pjUdJKKO7wtjGosPyHWL6LBIOThxgqwqxcVch8+HA2lbCyUsk/Rdi/D9OO0i+F2FAJEGsWg==
X-Received: by 2002:a2e:b88c:0:b0:26f:cbfb:784b with SMTP id r12-20020a2eb88c000000b0026fcbfb784bmr4776944ljp.357.1666263660991;
        Thu, 20 Oct 2022 04:01:00 -0700 (PDT)
Received: from elroy-temp-vm ([20.240.130.248])
        by smtp.gmail.com with ESMTPSA id z22-20020ac25df6000000b00494a8fecacesm2676152lfq.192.2022.10.20.04.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 04:01:00 -0700 (PDT)
From: Ubuntu <tanjubrunostar0@gmail.com>
X-Google-Original-From: Ubuntu <TanjuateBrunostartanjubrunostar0@gmail.com>
Date: Thu, 20 Oct 2022 11:00:59 +0000
To: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Request for assistance
Message-ID: <Y1Eqa7uKB+Wk+Mb+@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,
I have a diffictly deciding where exactly to split a long line of code. for example, this line of code is too long

uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14, pDevice->byTopCCKBasicRate);

if i spit it this way:
uCTSTime =
        bb_get_frame_time(pDevice->preamble_type, byPktType, 14, pDevice->byTopCCKBasicRate);

It does not help as the second line is still too long. I considered doing it this way instead:
uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14,
                                pDevice->byTopCCKBasicRate);
But i did this on one of my patches and i was told it is not advisable to split a line between
parenthesis '(' and ')'

how can i go about this please?
