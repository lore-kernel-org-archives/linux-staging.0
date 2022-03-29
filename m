Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5425920E5
	for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 02:04:06 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id z128so13605806pgz.2
        for <linux-staging@lists.linux.dev>; Mon, 28 Mar 2022 19:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=o1C/N7k3NvBFr+UwK4x8b6ScN+zhLx3X20kO3wGJzGs=;
        b=egQ2/hWe4My+5CfAHOVi0oWqZnTHksJedoVcn4yJ53m9qW9FCmzt7gzVcCIeua6Ghb
         aO+RE19WOQDk253DKTfg5uN8MyJINd8wNIWXksmYAB2LHh28siew51lOd/KQ5JpGgle7
         Jo7Blz1iIcnR3gB4nRS0XcXoebulkpnN5l+AJDa49biNQVT9T+joNrK309Ny2/OKDrs+
         J5Vwm/maFYIHB/RYQxOwnokJUr2AKfow1Up4/2WuTRh51IlDQSTuYlMVqgl4BoK5MzbB
         83SpAq6gJOsKDbxgIhPjkphgovNFhP/QSEFk5AC3qCoO98I+/McDXk8rwoAnkKj4RuSM
         7iAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=o1C/N7k3NvBFr+UwK4x8b6ScN+zhLx3X20kO3wGJzGs=;
        b=pLDBUgZLx4ZLY2xH3YJT9Mt0N9j+LiqXkaBAhcKybpr/4Zwf7VEdjXpbzbFQn7nWXe
         ziVaWnDHxgSN8uL9hcNtGLKkooWzQRKwJmpYEEgD3cEeO/mHA61fEvELjFRw3ez7LlC7
         SKydT5YIqAOGzegFeh67xHBIdUwHOArhfRIwvNPkDQDbqbrcuHjWvHer75/TQreKYH6z
         KH1Qxc6TIBiIbeqkJHgsAeakVdPD1WfMSwrgS6YlrwHNRjw5a4t/Hc0qXuvYsvJguJ5p
         DbdLNJs7Q1Op3lmYrPAtVvApf74Zq2b2Jx8d7imSRsNW5q8CNcq/PmM2SKVa5NN5LV68
         BzJg==
X-Gm-Message-State: AOAM530sPPpsyOsi/fQJectVDWkrfzScBhZBui+e8ri2hCncp/y7/MAN
	LeAPSSQ0iL5yIQbQc1BLdEI=
X-Google-Smtp-Source: ABdhPJxWSoZfrbImbacBCV9Yd4RuUQFxxhBKS47gx0JNznRDIgWtbVrXzE1W6vSRE2UP9qzs2CXo4w==
X-Received: by 2002:a05:6a00:140a:b0:4e0:54d5:d01 with SMTP id l10-20020a056a00140a00b004e054d50d01mr25768620pfu.20.1648519445808;
        Mon, 28 Mar 2022 19:04:05 -0700 (PDT)
Received: from ubuntu.huawei.com ([119.3.119.18])
        by smtp.googlemail.com with ESMTPSA id c4-20020a056a00248400b004faad8c81bcsm18203488pfv.127.2022.03.28.19.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 19:04:05 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: dan.carpenter@oracle.com
Cc: elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	johan@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mgreer@animalcreek.com,
	stable@vger.kernel.org,
	vaibhav.sr@gmail.com,
	xiam0nd.tong@gmail.com
Subject: Re: [PATCH] greybus: audio_codec: fix three missing initializers for data
Date: Tue, 29 Mar 2022 10:03:57 +0800
Message-Id: <20220329020357.10597-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220328141944.GT3293@kadam>
References: <20220328141944.GT3293@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

On Mon, 28 Mar 2022 17:19:45 +0300, Dan Carpenter wrote:
> On Sun, Mar 27, 2022 at 02:01:20PM +0800, Xiaomeng Tong wrote:
> > These three bugs are here:
> > 	struct gbaudio_data_connection *data;
> > 
> > If the list '&codec->module_list' is empty then the 'data' will
> > keep unchanged.
> 
> All three of these functions check for if the codec->module_list is
> empty at the start of the function so these are not real bugs.
> 
> Smatch is supposed to be able to figure this out, but apparently that
> code is broken so Smatch still prints a warning.  :(
> 
> Apparently GCC does not print a warning for this.  Even when I delete
> the check for list_empty() then GCC does not print a warning.  GCC often
> assumes that we enter loops one time.  I haven't looked at that, but I
> have noticed it in reviewing Smatch vs GCC warnings.
> 
> Generally we do not apply static checker work arounds.
> 
> I do not have a problem with this particular work around, but it needs
> an updated commit message which says it is just to silence static
> checker warnings and not to fix bugs.  Remove the Fixes tag.  Don't CC
> stable.

Yes, you are right. I have resend a PATCH with updated commit message as
you suggested, and cc you. Thank you.

--
Xiaomeng Tong
