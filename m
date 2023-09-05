Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D0ECA70
	for <linux-staging@lists.linux.dev>; Tue,  5 Sep 2023 11:28:49 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-402d499580dso7994515e9.1
        for <linux-staging@lists.linux.dev>; Tue, 05 Sep 2023 04:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693913327; x=1694518127; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SBDYPrNVNQs8uedEw8LKqB5eVyDGiSNo3aWK9hkZDss=;
        b=qzsSTOFAse2lHx1gLIpensioERgLXoAwf4NDKqnbsZIu6zf5MStcdH6M08+ILcw8+k
         Ic0+yDUlsvDLM/ywz17tFQjkxBed7dVwYGmlpGkFECQXOodBRDxLbcN2kPiPTEyRJD9p
         UyW7lG1P/161mcU4FRLVuZkdc3rpCLDDugHBgyV2BL88jmcKQ9VPvzXoHhVUchdTP8u6
         9/4aFyIsFWlzOclRajMrMapYSOBlK/9s5xB/ghzM8M5PNVvw7lEzM7GVOhITY9XBylr2
         c75pL+VnDWc1xzg9AxtylZZ/Np+VKjngoV6BuMvRVdNgqDiu8nNkgKV44xjCca78Aml5
         rdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693913327; x=1694518127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBDYPrNVNQs8uedEw8LKqB5eVyDGiSNo3aWK9hkZDss=;
        b=M3NwiBrC91CHKmY7VkqVG/U5oiVOf6umdApTVuNaXG+QdHT7MZJSE2If7OpAXNxkyH
         9FpTRicRa6eTouYYniNyj4RPupJVr2Q3e2JCku9HRH8lgsOp0bitZ9TTXRzgdOharWPc
         s4n8ykGs/FB61sk/oojCc4G34wPh6Hqt2Gb4QnUM0+ex9znWFdo0k1E4BLG/dg7+MAYJ
         Kami0XQj1wwRgEEmPrguNhzVb3GZPbb5OXdgKBWvUQ+9Ue/R+3V+ipKyWABNQNmyckpw
         kikPEegWnkKAMYeQuzrapbocBUOpqiEoO6mqvgRkAmQXx+qULn+irlEuw3b5UntfxQLq
         bFIg==
X-Gm-Message-State: AOJu0YyY/pOdOS/EfWr7x2EDnt8LI+H+stq3UGi7XpMWC1XSnDleym+/
	CVL3OQEjADBt4UZRR9A1MzklSg==
X-Google-Smtp-Source: AGHT+IGDVf33SsIv4JjPVvlDTBDhZwEBkV1Kn8Ud5kUo8iMjmsdpaIcy8Ty86NaRmLG7gKJTd1v7gg==
X-Received: by 2002:a7b:c8d5:0:b0:3fe:3004:1ffd with SMTP id f21-20020a7bc8d5000000b003fe30041ffdmr10106023wml.4.1693913327216;
        Tue, 05 Sep 2023 04:28:47 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o3-20020a5d4083000000b0031435731dfasm17137871wrp.35.2023.09.05.04.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 04:28:46 -0700 (PDT)
Date: Tue, 5 Sep 2023 14:28:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jonathan Bergh <bergh.jonathan@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: Fix block comments where '*' on each
 line should be aligned
Message-ID: <8ab11a98-5631-4ff2-93d7-dd0a7d72dd6a@kadam.mountain>
References: <20230903203732.585378-1-bergh.jonathan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230903203732.585378-1-bergh.jonathan@gmail.com>

On Sun, Sep 03, 2023 at 10:37:32PM +0200, Jonathan Bergh wrote:
> Fixed checkpatch warnings where lines with '*' in block comments should
> be aligned and were not as well as incorrect tab spacings at the start of
> comment lines. Also removed spurious newlines between define statements
> in define blocks

Do this in two patches.

patch 1: delete blank lines
patch 2: change comments

regards,
dan carpenter

