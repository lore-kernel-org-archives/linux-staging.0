Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37351881F
	for <linux-staging@lists.linux.dev>; Tue, 17 Oct 2023 14:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUkBmEJP"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1bf55a81eeaso37956715ad.0
        for <linux-staging@lists.linux.dev>; Tue, 17 Oct 2023 07:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697551324; x=1698156124; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mf0Hwm/v3vvhD6CROPYUWDbtris9frx708TKPgnvJOs=;
        b=aUkBmEJPzf/T+nJ63MwHDMCTvb8167Z+t88He19ARsUypASvqBOK1HT+pJDhrnL7Rc
         1baDYnjK4MydrZKvjZzx+6UzM/gWcBdpF3VHamL6P5HDAj/5dfnOBa9NOgRd+HNcqS10
         qMJL/6u7L4e4gbx210gs7E2NUEgptOtrUqG2LBUqG2nsuuzyF8QmrH9NCeyu74tcZbCQ
         dCG+8w3YPzYoiYnp/S+M9axnASAGXSDjBmGu2KzNnp7S2F827zJXNC5L0FaenIyor4pv
         ZUqDFxJpPkUmu7vKYA/xzoamyH43EDADuQLwId4DDOVXFCFqm/1O+3s15Q/TUik0GeGZ
         hVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697551324; x=1698156124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mf0Hwm/v3vvhD6CROPYUWDbtris9frx708TKPgnvJOs=;
        b=fWGudfTw+4lySRcGQpJEhTvwVc7tC9Kpvu9ywMf0VfnFrgUSL18K2vfePJtyeeDH3Z
         Gdc/rkbAKNeJ4MLsiE7gIpCNMHiX6NefMb56sMpxRJBLwfUuXr4N54hwaUqSgwvNDhJZ
         ze4nJgSJPwYCVQ4smBThMHsvz7cb11axpO8S92j46t9SvnPCVEncqZaN2JF6Zg+yOIu9
         B+JSKAkpVH3nFud6Azp0bKs3mUJBY2jqm/TGjIAtnC8yx3s11+O0viC+xm/qWXOimSg6
         TxOwrTWESRfa6c0rGysmGsaLauhgRC3qRhGxc7nXYK3wMn1c+a7q9DkICiUYb5cXKeQn
         ay0Q==
X-Gm-Message-State: AOJu0Ywr3u2xuECMmqofjcdRAfZB8fBc2nkZ0PY5REm+UISCcX9ma/Cl
	pMRMOBQvgvwkiTUIQMJDYVg=
X-Google-Smtp-Source: AGHT+IGCwru0RlhZVcPNWUZn1I8duRmLcM9uC1HppVLkK9RrRBntW0F5COVkjQx8BVDvu8W+GoaioA==
X-Received: by 2002:a17:902:e9c5:b0:1c9:ff46:1633 with SMTP id 5-20020a170902e9c500b001c9ff461633mr2240584plk.42.1697551324361;
        Tue, 17 Oct 2023 07:02:04 -0700 (PDT)
Received: from ubuntu ([223.226.54.200])
        by smtp.gmail.com with ESMTPSA id f6-20020a170902ce8600b001c74876f032sm1575146plg.162.2023.10.17.07.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 07:02:04 -0700 (PDT)
Date: Tue, 17 Oct 2023 07:02:00 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rts5208: Replace the occurrences of (1<<x) by
 BIT(x)
Message-ID: <20231017140200.GA3156@ubuntu>
References: <20231016201154.GA14625@ubuntu>
 <433b9d45-bb21-49eb-8062-c03bcffa90ff@kadam.mountain>
 <a45368a0-6f7c-4401-804d-1ff3cb8803b7@kadam.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a45368a0-6f7c-4401-804d-1ff3cb8803b7@kadam.mountain>

On Tue, Oct 17, 2023 at 07:06:02AM +0300, Dan Carpenter wrote:
> Btw, eventually if we fix enough checkpatch warnings, then eventually we
> get to a point where all the remaining warnings are wrong.  Like we've
> fixed everything checkpatch gets correct and only wrong things are left.
> So just be aware of that, that sometimes everything checkpatch suggests
> is wrong.
> 
> regards,
> dan carpenter
> 

Thanks for the feedback dan.
