Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5463628F2;
	Mon, 13 Mar 2023 15:04:52 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id j2so11608181wrh.9;
        Mon, 13 Mar 2023 08:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678719890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ntw4NswkvkQ8h4CSwsdP0fvCQYzjvQ4rhoDvE1FRNiA=;
        b=j10p2JFxLeoHLyUKBSeFyBDKP8szefabaernl+MIsCTI4EsJ0TjMK7xKZ1W5wUwk6T
         51ojoE0tgrdxgXvREnMJPWzo0iGFEV7FmeEYmlLSKRIyJaBlUkyWFlE4cKtLLhxfMgKs
         PY54x3NkgVGUvTMxZ+jaEjEakk2abQv78cLmqNkxfVWOPk33HKjrWeQv0x0lSt6nBpWx
         ATG74d+DjAzGBWQ0Fa6qquq0FLm46glGf2mSuSfiXP1Y6erKo1R6lVqcCiZCe/QPXYRO
         AYku9cgirKzxb5QvocIfW2hcaXjH4f1x3An32WVACgIMC+ilsYW/BtbNDqmDROTXquKq
         mM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678719890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntw4NswkvkQ8h4CSwsdP0fvCQYzjvQ4rhoDvE1FRNiA=;
        b=JURMoCOdCYCW4vtPs8axQv1p2AliAe0l9IJe40ipI2x7jVGax8qm1Y0xLEDaKv+Nta
         M/+M1YJ6eKOQf3Fj3eTNBh5qZ8xCe0W+yY5ECogbp2qbx/tcBt5mh3DWPvgrEB0S9wZj
         VkeT79O2o3uw8c7YY8PIYIdib+KWoy6sGgFgZxrxSzXQVMk3AeBjiN314cMNmkxo9GAg
         JI3Ll5PIOsWHevxN4R3CKLji67p9NX39v/vXhbo7gTUV8pxjWFo4yE/2Z38YhQoQLfdc
         DLpdbZJB5xnfKF8HYKqZXn1jax+m0lJkL3lT7Bp5i4MeYpfJWCwrzZgPBWeoZMGdh5Y7
         SO6Q==
X-Gm-Message-State: AO0yUKVcXkXtB+LzjLgDpH8Cv8gX3KUbmUZNZV8gWFe3YMBXd/q0E1uI
	1S6IopDHqmwux5i9liP7kVE6HSzkEno7SQ==
X-Google-Smtp-Source: AK7set/gCQvm68a5pe7NSAw/Kg7jjyn4kTIWaXE6wPFgiLpBwBQ8F+KtE0HSFSLXBouSVD6vahFiPg==
X-Received: by 2002:a5d:684d:0:b0:2cf:e739:9fbb with SMTP id o13-20020a5d684d000000b002cfe7399fbbmr482116wrw.22.1678719890408;
        Mon, 13 Mar 2023 08:04:50 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s16-20020a5d4250000000b002c56179d39esm4438264wrr.44.2023.03.13.08.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 08:04:49 -0700 (PDT)
Date: Mon, 13 Mar 2023 18:04:45 +0300
From: Dan Carpenter <error27@gmail.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: axis-fifo: initialize read_timeout and
 write_timeout once in probe function
Message-ID: <f545dc88-717b-4fa0-851a-733dd5fc2eff@kili.mountain>
References: <ZA4M3+ZeB1Rl2fbs@khadija-virtual-machine>
 <9938109.ZD9C4EEAuf@suse>
 <ZA83yzPTq+nQF9Dd@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZA83yzPTq+nQF9Dd@khadija-virtual-machine>

On Mon, Mar 13, 2023 at 07:48:43PM +0500, Khadija Kamran wrote:
> Also, I had one question. Is it okay to write a long subject as I have
> used in this patch?

People say subject should be 50 chars (I forget the exact limit) but
there is a little bit of flexibility.  This subject is too long though.
Perhaps I would use something like:

[PATCH v5] staging: axis-fifo: initialize timeouts in probe only

regards,
dan carpenter

