Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478D124513
	for <linux-staging@lists.linux.dev>; Wed,  9 Aug 2023 19:26:04 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so2674938a12.0
        for <linux-staging@lists.linux.dev>; Wed, 09 Aug 2023 12:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691609162; x=1692213962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vjD6SnFC9OBpLFcPn947ZxmbIrE3ZcubJS7r5cKfK/g=;
        b=hkJJ/OK+5utE0Nm6SDF5F8RwnoyMkEd1oh9WNIZQd1hMOJ7X0AwTwXQ8XzlYfqE5qk
         Z4Oiz6py0VjD+E3x2ItjagMRyk9Ie+8a0L6up+JN8EQfv9BP5XwxRPjLEBU6tZWABJHQ
         ImpK8zTkNRAE0ECdB445cP+lWCC7EmxwOsmbf1xQLe+sv+fiC8bpa1gdQ1Q4VPtVezPA
         ki49w8Ibrcw5Cg/gMUUTPJ/SZ2RV3S36x51MHm7n7UOjhmnBFL4e8mXYtQUA3IUqWOCC
         HpKGec9LapvTyfRZYJmAz0eHrT7fAp2MviZakyidkpAu5aCyb+YRTMd0JuggsvELgFnP
         IhQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691609162; x=1692213962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjD6SnFC9OBpLFcPn947ZxmbIrE3ZcubJS7r5cKfK/g=;
        b=Fry8QA3lQ1mjcNRqgkbg28RNHqAtnTHhP+mHu8Dpr5GocnhwGBoOpRADuxsJcIPgzD
         Xa54cdlG67SeTj6dJbmmwGScPQ4z1YUk8fiGpcqc1FcTiABxuWOhxPtcpUUN2LdQTq5/
         wAiQ4xHySau/czml1iM9x8O7JG2p4f+LdT9h+royRU2ekhM/wdiNeXoEaFRugsqGAa6v
         Fw0uAtXBS4MPIIHOzZQvR6Nuj/MtyRp7PbYCMFAvNKuiea38P83OEQfM6jVPMlluwlT3
         JVZ2CgHXgyKm63zllXwz6tXuRGWIbr37KK7fVYnKfIXsDcwFnRg23TzmzsUB6DIn0Y1V
         a52Q==
X-Gm-Message-State: AOJu0YwfZJMxu9b0a+zSzyCXl+dxLtUtN4Z7a+zFebdKmikj8sb4Vih3
	UpWjMdMcNsbp4WQz8u4h+2mwbjzgfJcjGQ==
X-Google-Smtp-Source: AGHT+IENJ7d8S4cUWVhvYtD3JCAWasRB5eZFzuCICORT2qGVlynQu6hFwzEIunA7TxVmkTH4KddNeg==
X-Received: by 2002:a17:907:c13:b0:974:fb94:8067 with SMTP id ga19-20020a1709070c1300b00974fb948067mr637357ejc.23.1691609161893;
        Wed, 09 Aug 2023 12:26:01 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id l7-20020a1709066b8700b0099c53c4407dsm8419091ejr.78.2023.08.09.12.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 12:26:01 -0700 (PDT)
Date: Wed, 9 Aug 2023 21:26:00 +0200
From: Nam Cao <namcaov@gmail.com>
To: Alexon Oliveira <alexondunkan@gmail.com>
Cc: gregkh@linuxfoundation.org, martyn@welchs.me.uk,
	manohar.vanga@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: vme_user: fix alignment of open parenthesis
 and deleted trailing spaces
Message-ID: <ZNPoSCriq7MYOLlc@nam-dell>
References: <ZNJKTLZ62SZMM6D8@alolivei-thinkpadt480s.gru.csb>
 <ZNOizFnDXojT4s85@nam-dell>
 <ZNO8XmOpylyE0AWS@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNO8XmOpylyE0AWS@alolivei-thinkpadt480s.gru.csb>

On Wed, Aug 09, 2023 at 01:18:38PM -0300, Alexon Oliveira wrote:
> There was indeed and accident commit modifying more than one line in my
> tree, hence the "trailing whitespaces" messages in one of the commits.
> So, to clean evertyhing up, I decided to drop these commits and start
> all over again, from scratch. That way I'm sure I'm not messing up
> anything else. I just sent a fresh patch in another thread.

FYI just in case you are new with git, you can always work on different stuffs
in different git branches. No need to delete your previous works, just create a
new fresh branch.

Best regards,
Nam
