Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5E8EEA3
	for <linux-staging@lists.linux.dev>; Tue, 31 Oct 2023 09:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rG5gBOem"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c59a4dd14cso75597951fa.2
        for <linux-staging@lists.linux.dev>; Tue, 31 Oct 2023 02:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698742808; x=1699347608; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=svPKQEuwLJUX+OUDlkCqm2MqldkP++ZChGFibYydOR4=;
        b=rG5gBOemWiZdwec4aqdQ13bJFNVdZ00sdJVwyTFI7sBpqlqpkNgjxJIG5Pqko7Hq1l
         9j3+E1MnpQj1F+IVrJAks7LOL0oYFBQjsvsVFl4F+sewABHR7vs3fxyqSeFTygyNmLt+
         IRk5Xy/CJwdJhBNO/lOuPgI+1MnMWQdkuDq0x5x8T6FmezIkGeOdCYJffhBHThDxhTCl
         23/gXOk7sGcx3A+jQyeDBZ8ndZI7R5hEuqS5vqaRzKkOfKNK8Cr8dTNpodGEBVju1V+f
         tdXjBygWLhq+sLnJrFkqS75Ok3p7eO2PXurFkT2dcpLLWX5CG2Tk8530g5Ax3iMIm5WX
         L+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698742808; x=1699347608;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=svPKQEuwLJUX+OUDlkCqm2MqldkP++ZChGFibYydOR4=;
        b=DmMDK5APO9BkU7bYP6cXeUaRueSr05CxYWF9t5Yx0Re10yVchb2uR1kCbsuoPR3pDZ
         Z2jecpX2NZyKxjN0tMAKlOVPsOuX+xm/uEDu+i3muKoIxrlAqNpf5ZKcmYVOeBdIfwAv
         Ak4m47gjDW5QQJYNTNbBgHBSi6SjTYGiA7NxkLgelakIEbm0J1CdnaNQnLettzUfZvq8
         ngoPi++LzJc7TWWpjKECKP1HwG6U9XFgy5j6B6W5pQVOnmVY4y3U3BUI1phJVZYG8Yc5
         UmxS6bU16mU9zessOXAoxiY5FMmC+rSUP26Pyf3LYDW/5bG/1H7Y2FhONRC6gOWWzgZF
         cvww==
X-Gm-Message-State: AOJu0Yy0O3qQGGsDO94fHZBKJaiI/M8lKwcMjxDoPkUmbzG80VR+HZQF
	MzMmrTC/lxTwUzjeh9lRYGgNDxMrUMHSGR3haXw=
X-Google-Smtp-Source: AGHT+IF+vlStMbz28336b8HhnErxbeHzy04DOK44sKvthbpTr+WucNUW4JaIvtJK0orsEPvCJCXTrw==
X-Received: by 2002:a2e:5012:0:b0:2c5:16d0:69ab with SMTP id e18-20020a2e5012000000b002c516d069abmr9247433ljb.44.1698742807955;
        Tue, 31 Oct 2023 02:00:07 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u24-20020a05600c00d800b004068de50c64sm1093240wmm.46.2023.10.31.02.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 02:00:07 -0700 (PDT)
Date: Tue, 31 Oct 2023 12:00:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: umang.jain@ideasonboard.com
Cc: linux-staging@lists.linux.dev
Subject: [bug report] staging: vc04: Convert vchiq_log_error() to use dynamic
 debug
Message-ID: <aadedac5-779f-4952-89d8-32cfafec59e6@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Umang Jain,

The patch 1d8915cf8899: "staging: vc04: Convert vchiq_log_error() to
use dynamic debug" from Oct 24, 2023 (linux-next), leads to the
following Smatch static checker warning:

	drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:690 vchiq_initialise()
	error: we previously assumed 'state' could be null (see line 685)

drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
    680          * It may never be ready if kernel and firmware are mismatched,so don't
    681          * block forever.
    682          */
    683         for (i = 0; i < VCHIQ_INIT_RETRIES; i++) {
    684                 state = vchiq_get_state();

state is set here.

    685                 if (state)
    686                         break;
    687                 usleep_range(500, 600);
    688         }
    689         if (i == VCHIQ_INIT_RETRIES) {
--> 690                 vchiq_log_error(state->dev, VCHIQ_CORE, "%s: videocore not initialized\n",

If i == VCHIQ_INIT_RETRIES that means state is NULL.

    691                                 __func__);
    692                 ret = -ENOTCONN;
    693                 goto failed;
    694         } else if (i > 0) {
    695                 vchiq_log_warning(state->dev, VCHIQ_CORE,
    696                                   "%s: videocore initialized after %d retries\n", __func__, i);
    697         }
    698 
    699         instance = kzalloc(sizeof(*instance), GFP_KERNEL);

regards,
dan carpenter
