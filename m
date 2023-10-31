Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F23A29
	for <linux-staging@lists.linux.dev>; Tue, 31 Oct 2023 09:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XXvaEh5a"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40806e40fccso35688825e9.2
        for <linux-staging@lists.linux.dev>; Tue, 31 Oct 2023 02:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698743300; x=1699348100; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xpXKFnUDplvUDItzvFUTE0LsBMMlzWgnaSD939CoMz8=;
        b=XXvaEh5aP1tLR4WZrBOyh9ZjZGfR3do57PAlV+HCuuh2RlFLFn8jW9Fpd4FpSpDhwR
         AQ3tc4AsrRd0jdNH/nakc8Q5d9cx5C0WZQd+JBQBTSVE+IGGESb4zC/1uNk96P7fo5+J
         cVk4sJKpd8HN8tmEFoDXn7mEliehNep/n1kSdZ3DxviSLhGyAoyOnuFWjoX06a9m38eY
         bIHz+7Enp7zqfbmWSCAgJr/4Oc18zpx8WASSb6cK7/jNNrPfVzlVopZl84o0T9abWtgu
         ZE5FZWML2IdLTJdQwA2zTUAHdq3f6XNkY9G2GCr06Bu8RoK4H72e8soeMcGyx5C+dX8p
         WSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698743300; x=1699348100;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xpXKFnUDplvUDItzvFUTE0LsBMMlzWgnaSD939CoMz8=;
        b=QqQxk3lp13FcZVMj3b87PQ+ZFhes4YZBb9DTdJMD5VFkQnVWFGwcX9mginzsjdePFu
         r3VqVnVV2eayJT3ZwDLTxIVcYlpZxSffcDeQRCRnsX0NCHvzWbPDClvu/ZA+vwBpoogI
         8lUWoTWbF/5bt655zqpH6+5bJJ7YXLZsRVdZ2G1nQHnIfepCFJS2GFSjTynUSbWh1k3O
         DJA6NYKYsxX9Klm5yZTt8tXpF/vxQsC11qR0tIt9vE+Ks8WjMa5wFuc7Y4EGt+BxfDl9
         8HbpwEpm8mWAnDQlo4NRb6ZD3xOQPl4JSX0ARpSSwFpjhsYTNBTCizxhMXCwPe/ZvJZh
         eD4A==
X-Gm-Message-State: AOJu0YyIslW8dL7imJl8E0l127KQvVJbP3LUQmcvRaV6yj3PLQdQXKAT
	NCXdYY0GCKioUSSZvpAqowLCzQ==
X-Google-Smtp-Source: AGHT+IFAMBbn14jVtSVp5g9b9X78C9y3LG4Ea5uCZePaIKmJ6AjUQsvyXNbTpqYkFJo7utIeEN7jEg==
X-Received: by 2002:a05:600c:35c2:b0:408:37d4:b5ba with SMTP id r2-20020a05600c35c200b0040837d4b5bamr10978625wmq.12.1698743300257;
        Tue, 31 Oct 2023 02:08:20 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m7-20020a05600c4f4700b0040651505684sm1145362wmq.29.2023.10.31.02.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 02:08:19 -0700 (PDT)
Date: Tue, 31 Oct 2023 12:08:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: umang.jain@ideasonboard.com
Cc: linux-staging@lists.linux.dev
Subject: [bug report] staging: vc04: Convert(and rename) vchiq_log_info() to
 use dynamic debug
Message-ID: <be68424a-ce70-4a91-8b63-13fa4cce22cd@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Umang Jain,

The patch f67af5940d6d: "staging: vc04: Convert(and rename)
vchiq_log_info() to use dynamic debug" from Oct 24, 2023
(linux-next), leads to the following Smatch static checker warning:

drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:248
	find_service_by_handle() error: we previously assumed 'service'
	could be null (see line 240)

drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:290
	find_service_for_instance() error: we previously assumed 'service'
	could be null (see line 281)

drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:313
	find_closed_service_for_instance() error: we previously assumed 'service'
	could be null (see line 302)

drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:1176
	vchiq_open() error: we previously assumed 'state' could be null
	(see line 1175)

Also I see in vchiq_release() we dereference "state" before the NULL
check.  This warning only triggers when the variable has definitely
been dereferenced before but if debugging is turned off then maybe the
variable wasn't dereferenced.  I'm going to change that rule to complain
when a variable is possibly dereferenced and see how the output looks
like tonight.

drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
    233 struct vchiq_service *
    234 find_service_by_handle(struct vchiq_instance *instance, unsigned int handle)
    235 {
    236         struct vchiq_service *service;
    237 
    238         rcu_read_lock();
    239         service = handle_to_service(instance, handle);
    240         if (service && service->srvstate != VCHIQ_SRVSTATE_FREE &&
                    ^^^^^^^
Check for NULL

    241             service->handle == handle &&
    242             kref_get_unless_zero(&service->ref_count)) {
    243                 service = rcu_pointer_handoff(service);
    244                 rcu_read_unlock();
    245                 return service;
    246         }
    247         rcu_read_unlock();
--> 248         vchiq_log_debug(service->state->dev, VCHIQ_CORE,
                                ^^^^^^^
Unchecked dereference

    249                         "Invalid service handle 0x%x", handle);
    250         return NULL;
    251 }

regards,
dan carpenter
