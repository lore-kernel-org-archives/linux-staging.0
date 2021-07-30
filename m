Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E068E3481
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 13:42:43 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id gs8so16832729ejc.13
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 06:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4mLRgm41sEwV+M8Z6i0AzGBmhntB7o9J7sCDyPkGJLQ=;
        b=JYSH94TaGr+ucvyYcPdbQZYuCyROUNDpOCakeX/np0ahBVWillGRvdlCIX/i7oY+Oq
         qYN5R7RfZhaseAhjaF2mUkWL2QHanjAHJcR3dZ9Yv4xea+R7LpeILHcNIawbgx5RCIes
         xwHn8a6xQBLX301HQRfHQiL5cWDD76r5l2l56ltnblEk7Z3uC7tkbWiyriAM/IHD3UQW
         Bf3YXaUOG9C8mZQmfpuoCgnQUeH8n7/w/MwjwjW7zz4j0zkYJE3eyU4jRULzzCPZAXOM
         WujWcL6bLRQRnDxkgyiMTBZ3vcHA5G25JlBqcgDrtnwTtgO3Y3LXC6FKnm11NoRAZwgS
         fVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4mLRgm41sEwV+M8Z6i0AzGBmhntB7o9J7sCDyPkGJLQ=;
        b=EnuVGo9vJjLMFaBnO6yaXeqm9YqsGm6Nr4YOviJbN0hbnu0wVQ1SRFmhl8b5EQkg9I
         Ti4Fk4KOqEdjouDvHomkLrfO3M55QAIhayHvMxeGOMVKhF4ralNp1DigBUu00MIgTgTL
         u/9GWEmt55D84Xw+8yhblKU48cOIf34rh8yg+db11UdE9KBHqYXtq0WvWikzODpfHjDu
         9ExcJ3+yQkm0w206Ag8lX+v+VEgca1K5QS4j3gD8yhq4pKXdoI9xF+JahFAfrZjV4VG5
         ENnqgeycuFWA/3EyjjC81i8WIBKULE7RDyP+G2qnbymTPvlihz/yK/fY6gf7XQ0Mgspi
         hXsQ==
X-Gm-Message-State: AOAM532vjpgVX/cN2970v4dA+CQA85y0Y1h9FmMPj3AJbkM6YbO3OF6M
	8igSFS2hTmydPBl/EeTYp70=
X-Google-Smtp-Source: ABdhPJyTCCqGqCaAYEuItSaV0fVQ/2Et/rGa2bahcW3mBCK/2G5vKda74wS0LTWnLG+prSFgO72W6Q==
X-Received: by 2002:a17:906:a08a:: with SMTP id q10mr2593710ejy.100.1627652562383;
        Fri, 30 Jul 2021 06:42:42 -0700 (PDT)
Received: from agape.jhs ([5.171.81.215])
        by smtp.gmail.com with ESMTPSA id gv7sm592776ejc.5.2021.07.30.06.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 06:42:42 -0700 (PDT)
Date: Fri, 30 Jul 2021 15:42:39 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: hdegoede@redhat.com, Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Sterba <dsterba@suse.cz>
Subject: Re: [PATCH v2] staging: rtl8723bs: remove unused BIT macros
 definitions
Message-ID: <20210730134239.GF1433@agape.jhs>
References: <20210730133914.8625-1-fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210730133914.8625-1-fabioaiuto83@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Sorry again, please ignore this,

thank you,

fabio
