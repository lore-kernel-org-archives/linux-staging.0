Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026003481
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 13:23:53 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id n2so13121293eda.10
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 06:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7yIqlbzzWHcgJJGINkVM9iOtv5KFT5YtfSXEjGM3zdQ=;
        b=GmIHoPg5GNxIFdKM8f2Hqavm9fNVDcoosF/FBxC/SJiZLraDSjVEYaEnfG41S1mHpn
         uRMvirFIqMppcZaaryKRA1jP4Ob4z5odoCv3LCYVvlgI8JK5oVZ1WQVjq+Qv+FuPmE6/
         9dnUM9bVsl0RqVydsOwrZ+dVchkeUfj7i95EdQnlrL+0k2ekxwxlhglOWWD76gugEuDJ
         drdCugUB5KS/9t60pz/GsSbq4FPaTKV4MSc9IwTndkUAxFkF1cjgeBarwo8nL7j5rlgt
         t4LnX8G/WUI/4uWsLj1hLXwk46NW8J8mDWfYAKL6XbxSH7804+nTl/tuQfj6pbmtHJ3h
         Vmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7yIqlbzzWHcgJJGINkVM9iOtv5KFT5YtfSXEjGM3zdQ=;
        b=rCT6/BH/qGVb3t6KGeKD+cbAomQG6lG+VQXXNyMBDLKBS30VVANHIHSUNrh1NGv019
         J6WyJpytyUs+1/g+/fr6cGhhWtvCjKrEP8pw8xCRliO8wAUQZYkVdqonynW3DCubU9+W
         d/1NY6H4AJ2duQDWChD4MfUmZjbrhldpSpby+xyOy70F8FTpl78e4kmvzKCe/ikBHW1Z
         hRU7JHnsQzhnjLWz+/b6zMnr9GgnXfli2axGyniRFIOZRrqxDP/LTefcTD97eiB2I/Jz
         4gYa66wdiHdcS6uCzg9ODMAmOhvcBgvrV9f73o4LV0SZDC2q7f/G32+gzUuUVhEBxxl7
         9FiQ==
X-Gm-Message-State: AOAM533sh7Nf1jtUERBTDjdpMG6Gu7pSs0+txctEhfnhVIRlGgNnmMHj
	WyFi5z7onnNjTp3EHtl8M24=
X-Google-Smtp-Source: ABdhPJwgcbCr+6m8bxDY6aJiF8lJWF6BfdZsm7/9qHmLOlerJYp6qqUIu4IAmsSxKSZOvVpzKZZ1lw==
X-Received: by 2002:a50:fe07:: with SMTP id f7mr2889158edt.334.1627651432361;
        Fri, 30 Jul 2021 06:23:52 -0700 (PDT)
Received: from agape.jhs ([5.171.81.215])
        by smtp.gmail.com with ESMTPSA id lj20sm558144ejb.40.2021.07.30.06.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 06:23:52 -0700 (PDT)
Date: Fri, 30 Jul 2021 15:23:49 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org, hdegoede@redhat.com,
	Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, David Sterba <dsterba@suse.cz>
Subject: Re: [PATCH] staging: rtl8723bs: remove unused BIT macros definitions
Message-ID: <20210730132349.GD1433@agape.jhs>
References: <20210730131903.4846-1-fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210730131903.4846-1-fabioaiuto83@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi all,

sorry, I missed the To: field, ignore this one.

Thank you,

fabio
