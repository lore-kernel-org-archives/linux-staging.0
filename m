Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374212C9D
	for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 10:20:12 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id j16so8384483plx.4
        for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 02:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eNsBUeSPBs0Qx4jcu0B26Fmmisvc82tqbPd5SR7juWw=;
        b=PO6ZuNzqPth2Ll5QiIIVzIuXypGKRintUdfijuI4Q3ax8D0X9bnCQa+lRPa8PJJVzz
         Nrnot9GwYozCGu+i+AakNEHNI0U6nYXjdc1lmKDVfiH2KaDhIm0fRrXVhP3VjBJ0fLh2
         qScsbySfuLmCg4Htow+98kU4NCNM7qtbU2LkjhJbhtEM5xBt4g9tYGnIsZB/cl1Yhy2h
         0YKyoeKHxb9iWDPdoCjCWO/SWAu9IlZAzu1s/IRM0WmKe2Tn9wTkLGmwBkUfgVKXnmKb
         8kv2GJVroz/TZYyNVRoUmFh2VFe4jH/GpPr09gdelU29raOHfmBQlq5s1vF6tF8sv1tq
         JTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eNsBUeSPBs0Qx4jcu0B26Fmmisvc82tqbPd5SR7juWw=;
        b=faKIf+PSrwV8UTxNJ1zLmk7VaEQwNa4MGsVMyXnrJ5S8rNiqx2Rrkpowi52fzQPBGw
         pfaelg6Oqp1B4ywxkPfH9JIoVwA7j+yd0Q/FBJ939RwwD2bDxgPhPGVLMsvqDhgdsxvT
         xu0uemmWea3a0Lq5Hsxx4Q63i8kKupVQ8IcxFPSs1LwVSkjbl25T/xQkbN9EEzQv38o7
         DGgYP88qd/tHcur+gMiYtVZ3ocFWeuXmmQdEe4vIYdp9PTno78mlR4m7jHPNKit223pa
         r4gQD5Yz7r0Aro6hUO05mWjfZDwTNWS9b92keWjYi2PTMmB0xJV3+KwpIxAUqzuHrOZc
         VOuQ==
X-Gm-Message-State: AOAM53266Ux2ct6GYWp79K7G/G7qq751BPK+4SYDJ7oDsZAV74cbncWk
	Vi44aFvJmaFAQY8fVJyPutA=
X-Google-Smtp-Source: ABdhPJz8lNeovR2tijhKSePiGxzOcKkGdCrx5jTEU0R+kIZq2KeNdlh1xfxdG38Qp5rLn5lE9CYEoQ==
X-Received: by 2002:a17:902:bd0a:: with SMTP id p10mr12779367pls.159.1643451611733;
        Sat, 29 Jan 2022 02:20:11 -0800 (PST)
Received: from nlap2 ([171.78.146.184])
        by smtp.gmail.com with ESMTPSA id h6sm12312606pfc.96.2022.01.29.02.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 02:20:10 -0800 (PST)
Date: Sat, 29 Jan 2022 15:50:04 +0530
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	straube.linux@gmail.com, martin@kaiser.cx,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] staging: r8188eu: remove unneeded ret variables
Message-ID: <20220129102004.im7dcq5gbuyqlw4o@nlap2>
References: <cover.1641551261.git.abdun.nihaal@gmail.com>
 <c9c24c13d2823ccaadbbce33613d1242531dbe86.1641551261.git.abdun.nihaal@gmail.com>
 <YfATARBq6FJ2e3HE@kroah.com>
 <20220127152543.ttvp7gj5bzpuvr3p@nlap2>
 <YfK/aOgEqftXuj1S@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfK/aOgEqftXuj1S@kroah.com>

On Thu, Jan 27, 2022 at 04:51:04PM +0100, Greg KH wrote:
> A single patch per function you are changing is a good idea.  Do not mix
> them all together, would you want to review something like that?
> 
> Always remember that you want to make changes obvious and simple to
> review.

Got it. I'll split the changes, as single patch per function.

Thanks,
Abdun Nihaal
