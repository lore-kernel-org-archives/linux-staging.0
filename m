Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7BA2C81
	for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 14:47:49 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id i12so26921471wrb.7
        for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 07:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=E01AI5APtyK2m0eSU6exeT54vrZKIKO/jub/6lEpXD8=;
        b=aBpZRZy9foy4RVCxq4Uw45cxrcpMxJLwguwopABXPo4pOZ3LVAo02bMyDjwJp6J2q9
         IXQeslNGFCp8mOY3iZmlWZfId5L4Y+6ocnpunDoUYkl8vtNHjwwHz2FJnrOvbNkFTAjE
         RfyvkWDBA4WUAJgxRdSSRve3xSgzOVcOe4aLWMkIT+1mwKp4SOO9Z0wVWYoSJm/aaKfd
         dVwRupUFOUWy8d2gNLteL84XjSMp4VjaiIWI5rzi8p5PHRWQYb11WoukC1LWsfJLdShr
         LF9Bi/62Ujtuk3gz5dYX6n3tfPBhzE1i8q2QZTe4MSGKjf5esx+ImAlSyjEw1T/Jf1iR
         rTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=E01AI5APtyK2m0eSU6exeT54vrZKIKO/jub/6lEpXD8=;
        b=W/LyDUB9u4v2O9pxuYZ9+l28hOL+pL/pbdcjKY7H9qSuYHl73MRklDEguBwe1YiTEZ
         7FCC+vG10YuJEQ/Ydg91gVaMJFcWzCn59kzzDW/hWHVb73Lvi5kFRU1jF8Kn/xrsey8+
         HCuQ5GqVWmSgl8T53osxjAfMWQraYEnBXvfgeaIC3ak52UY0AJ3Nw9X0+tcc/r6llQYR
         KlqyOTXQwXmCyPmZ6JPBdx3zfMNqntTcELhEnTnAdIZ/HAvdzjgPMstbGRFF/hKwbqiV
         3O+QOJlpJIazpYGHkRuIXIpHHGGY7VHEnXJKAS2XZ13V5NrGdnG4HKAGfxgLg5rDpEyy
         QK/g==
X-Gm-Message-State: AOAM532aujHHKA+m8QADAMEAvvXnQS4R5+ToqIhge8iU+AbL8xDI9T1Z
	mmNfzqOPlGM2Pg3dNZDYDWIWkA6WG0MwiA==
X-Google-Smtp-Source: ABdhPJwZL3GWwgRnLJzE9GphyNya1Md7gDBS2tz2GZNzXJn15y6ritGU+TgSMv/KT3+T+KwnJTXmFw==
X-Received: by 2002:a5d:508b:: with SMTP id a11mr15364611wrt.417.1634309268218;
        Fri, 15 Oct 2021 07:47:48 -0700 (PDT)
Received: from ?IPv6:2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62? ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id i17sm5662312wru.18.2021.10.15.07.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 07:47:47 -0700 (PDT)
Message-ID: <85dfe2c18e7ec4bd5ae67f7a81ab6197a82e0d86.camel@gmail.com>
Subject: Re: [PATCH v2] staging: vt6655: Rename byPreambleType field
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy-kernel@googlegroups.com, forest@alittletooquiet.net, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Fri, 15 Oct 2021 15:47:46 +0100
In-Reply-To: <YWlj9x6kwYUT1jlQ@kroah.com>
References: <20211015102444.90753-1-karolinadrobnik@gmail.com>
	 <YWlj9x6kwYUT1jlQ@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hi Greg,

On Fri, 2021-10-15 at 13:20 +0200, Greg KH wrote:
> Do not do multiple different things in the same commit and especially
> when you do not describe them in the changelog text.

I wasn't aware that changing this preamble-related variable would be
counted as a different thing. It makes sense, my bad.

Would you like me to amend the message to say that I also changed
`bb_get_frame_time` parameter or just drop this change completely?

Is there anything else I should address in my v3 patch?


Thanks,
Karolina

