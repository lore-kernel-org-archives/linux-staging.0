Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AFA7B;
	Sat, 11 Mar 2023 11:59:10 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id ce7so5156034pfb.9;
        Sat, 11 Mar 2023 03:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678535950;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2iWle2iP7O3ZzMcsGe+0E5W+ig5LC5QHh8IHUW1H3Jc=;
        b=XlAACvVsh8o0oJq5MC2Ui8zZZ9sLrvE9lEyiOnJnU22GkXitISIwo4Rhe2WwY/ztw+
         kermuC0CyNlbXy1ByYHBlOIZVYJzaMl+cgDPXwmcisYLyE4ej/HPD73djVeBRFiMMFWQ
         pvzcetLGvvx28D0NLwdBvqRD5rb58H7lJNIrAp39f6vSNGzbvBi4qPBT6nfrBdYE+TH3
         ULtYK2/bU2Yh6lY+o46pVbphvR0cmSuroHMU82q+mFBywbOELsnsiUPFFmoiGg39oA+0
         GTRL/zkEo2wXZbWOUjTI+4MRAcj/EN7wD7oWCvm62OSVjT2F5Tfx/Gh/eIVSRu/qYK8K
         QpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678535950;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2iWle2iP7O3ZzMcsGe+0E5W+ig5LC5QHh8IHUW1H3Jc=;
        b=yrVGtK9zUV1mhjCgTxhbrXeFRQtiyLp4ck5Dq+9K/5Rw6sjdavy2cvKuNISzjarsmA
         07ExuqOW8VDZe0njON4jNxLMRRkm08hD6dUdcHewk2Qm/iNtIO1w10Vb/njALYzuKeMT
         OkMxv9Jn3YCQcB/NA7vlEPvG3P1jJHlOezLK3Dlx1gaiXtF0UCvpn6r6o1l2pXuOmotK
         Mv+MoEqtBz0rY+XWpSFwJRoXMlxSaGbNQ7DhqGdG33P+3JOkRwujwAdABwbXDGRJA9xm
         /pd+g6tPq1SEo1yoTstalUd40aL6y4WlR483JeHl0U4+JmMx+i47/ziF9ho2pz2aWSS1
         /d3A==
X-Gm-Message-State: AO0yUKVp/sMqB+AQ0LxRCdzwmkGdD9z/PaRdCkqWMWcHaI8Az8cmD4X9
	7sLzoDQwxi0BJY6kiS98qdscoPm2eT3oEw==
X-Google-Smtp-Source: AK7set/aSX0gDnhBk8gzrT+67aejJXVNC+B/+C1QwsR6NmE9hSRqQUCsm58FQKBalM4nzbI7zbA+9Q==
X-Received: by 2002:a62:8458:0:b0:622:feed:c36d with SMTP id k85-20020a628458000000b00622feedc36dmr241718pfd.31.1678535950266;
        Sat, 11 Mar 2023 03:59:10 -0800 (PST)
Received: from ubuntu ([117.199.152.23])
        by smtp.gmail.com with ESMTPSA id j22-20020a632316000000b00508e7bd761fsm921101pgj.87.2023.03.11.03.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:59:09 -0800 (PST)
Date: Sat, 11 Mar 2023 03:59:04 -0800
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev
Cc: julia.lawall@inria.fr, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: pi433: Change bit_rate type from u16 to u32
Message-ID: <20230311115904.GA21529@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2303111249470.2802@hadrien>

Hi julia,

I forgot to Cc the maintainers of the code of the above patch. I have Cc
in this mail. Do let me know if there is a need of recreating the patch.


