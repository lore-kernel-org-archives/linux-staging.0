Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B32E63DF
	for <linux-staging@lists.linux.dev>; Tue,  5 Sep 2023 09:41:33 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-401bbfc05fcso24230165e9.3
        for <linux-staging@lists.linux.dev>; Tue, 05 Sep 2023 02:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693906891; x=1694511691; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7xJD4WZzooRqeAys3kMlFGQT7fDRPnPG5AfEDZE/Wns=;
        b=bufBPEmnUqrcT5HWgi7zUJIS4PiGTxT/obr7YCQR+3jm/VU1rQTaeN3bYtb7uiK8YD
         mNnzI1U0rIYuTwd+DnQZe9gs0hiq84kgU5Irb2ONU3ZwH3PjK3LyJHun44y/CSYL91xN
         2NyyrVAbaTvGl9rZ0tOGssS8cSA+yJWmHdSsM+1Vqh3q5cd04oUn1veXqgZVuJogsvwx
         NcwAtPwh2cAfqKwVBHEx+vfHqAacG4c/HDolX9x8xrmlecwjebxitqaxAxRSH6X4N+k4
         cG9kNoXJ8OMf7EQEjAxDuZwTSxOMqWtkK6kdGytk0ybPc8Xb70Rqy2evPY7c7L+60NoG
         jBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693906891; x=1694511691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xJD4WZzooRqeAys3kMlFGQT7fDRPnPG5AfEDZE/Wns=;
        b=ZkQB0537vK54MMovtjZOokMEttLvcqNYAQCM27XMd8EYuyvR6P2bXBVXechzdGWokX
         MmXvzPVvFEV15V+IKD7TlyQArQHmWiyMvivYV7CWwrZcoaXvxdVKpHhlphqxDSbaJ7qJ
         GnkCYLZw6UlB3PSycEqS3nddT4MJjTvhr4wjzznubkTxyMrflxQ5SBwKmw+hgIQMuvuW
         UcJSNj+fPwRPA9/urBOsqiqSvx883i1Ai7XGGxpRxOgdQSmZjiGRv/ULL43k7AsJCkL8
         3vCmtyuhmpfVB0E1XT4Ylp61qUm8r4cR+6O5+YLpmrSX4GWh4HOOgPUDmhIjq1ij8PKo
         iqKw==
X-Gm-Message-State: AOJu0YwdN37yg5nTXtUlVjNmHgHbQZAysykbjztPAcjJ1ToDeLsUUEwZ
	HvFqtMx5gmbhHPv32samBxJS5A==
X-Google-Smtp-Source: AGHT+IEJwZxZXiRrwIx12aJkx7UtlPucJ+t0epYniwlLopc18cGms6bY6YAxIWaBO20cE1QEysaciA==
X-Received: by 2002:a5d:4591:0:b0:31d:d977:4e3d with SMTP id p17-20020a5d4591000000b0031dd9774e3dmr9934077wrq.19.1693906891481;
        Tue, 05 Sep 2023 02:41:31 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q12-20020adffecc000000b00316eb7770b8sm17106364wrs.5.2023.09.05.02.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 02:41:31 -0700 (PDT)
Date: Tue, 5 Sep 2023 12:41:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Oliver Crumrine <ozlinux@hotmail.com>
Cc: gregkh@linuxfoundation.org, colin.i.king@gmail.com,
	sumitraartsy@gmail.com, u.kleine-koenig@pengutronix.de,
	geert@linux-m68k.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 1/6] staging: octeon: clean up the octeon ethernet
 driver
Message-ID: <e76545f3-b6f6-4bf0-a854-2bc33b743759@kadam.mountain>
References: <cover.1693180346.git.ozlinux@hotmail.com>
 <PH7PR11MB7643335E674EE3396E78E004BCE1A@PH7PR11MB7643.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH7PR11MB7643335E674EE3396E78E004BCE1A@PH7PR11MB7643.namprd11.prod.outlook.com>

On Sun, Aug 27, 2023 at 07:58:17PM -0400, Oliver Crumrine wrote:
> Make the octeon ethernet driver better adhere to the
> kernel coding standard.

This is way way way too vague.  It should be something like:

Checkpatch complains about "quoted text".  Remove the typedef and use
the raw enum instead.

regards,
dan carpenter

