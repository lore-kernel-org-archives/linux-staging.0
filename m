Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED20472
	for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 11:10:58 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id b26so7732500edt.0
        for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 04:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N+1z1RrCZDU4eUSXxu48fTP+rh2VRYtjLtHCM2Wvspk=;
        b=pEzW2ksS5HeGfr33QylIMIGTDgjsPV2g3iIcOrEDYbGF4bqBJ94bSEnEikBpUVIxYN
         Ep+dNv99oN4NydqKQKtDS4XKN20T/KTbEkOyrsTooiVmiLFOX6UKbUdpgpvFjKYbml7U
         G9ydfszhoLSEudCJXQCQHLWZYcJUj/MnH0RSkUDhQbBJib4oE1eJHCjlHwLD/DGirTss
         7i2lbORz18LJ+wR6AqUgeK9GU0R7Yro0zLnbZBBe1rl6HFGtBpLWlz3LJJQlfq3/Lf6l
         OlbMpPR7cC8XJ8wPhu2DUnAXmTPzqnHhL5msOimetezMT8HjExZvRVG1uKNWQ1ZWxIq2
         IH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N+1z1RrCZDU4eUSXxu48fTP+rh2VRYtjLtHCM2Wvspk=;
        b=DDVnB1OZBPaSKQFnH7YpOSqbkdi2aV8lvriwG+MOYqcXcmG7GrAq9KYjhRJoeBAKKj
         qPKbRMnwf+F1ZOwCq5QL6AmXjQsBMbqz2k5vorqpSScb3tUWFWiAZnLP1EWaKa7wFRJE
         hNTc9+wOc0HIrBdAj4Q4oIstd1CCN1BNLtJEQ/mHZu5IO/e4+L6+8rqNocVTxIYCVuxx
         aWd34LxnLqnigobPcDGgtND+bB85hpXDtXswDKL88D1EadwwQKdwx4OELg+EGIj/FaN3
         7P17F/EDhBMscVogDlQe9DaEyTX+DqFUfqPd4is8GUJLfUaDjQgaNAr2ztlQ3rSznsKy
         n26Q==
X-Gm-Message-State: AOAM5338GmGkam7KOL+zh02tq0jfArF9TXkgrgTWVCZG6jqI5THtcOCt
	egrBoW3B8FJaWrRmnNTJEbY=
X-Google-Smtp-Source: ABdhPJxPPEVIAyL1G1s5mhQQTeLbtfKw26z+zbfNcpyGYYq41GRonsS37IYDTrnNA6qYrL0s12uPJw==
X-Received: by 2002:a50:da49:: with SMTP id a9mr17246354edk.281.1632654657215;
        Sun, 26 Sep 2021 04:10:57 -0700 (PDT)
Received: from localhost.localdomain (host-212-171-30-160.pool212171.interbusiness.it. [212.171.30.160])
        by smtp.gmail.com with ESMTPSA id j2sm8692969edt.0.2021.09.26.04.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 04:10:56 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com, guolongji <guolongji@uniontech.com>
Cc: ross.schm.dev@gmail.com, marcocesati@gmail.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, guolongji <guolongji@uniontech.com>
Subject: Re: [PATCH] staging: rtl8723bs: remove meaningless pstat->passoc_req check in OnAssocReq()
Date: Sun, 26 Sep 2021 13:10:54 +0200
Message-ID: <5520271.xSIEuOTSxb@localhost.localdomain>
In-Reply-To: <20210926103014.30088-1-guolongji@uniontech.com>
References: <20210926103014.30088-1-guolongji@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday, September 26, 2021 12:30:14 PM CEST guolongji wrote:
> kfree(NULL) is safe and the check 'if (pstat->passoc_req)' before kfree
> is not possible.
> 
> Signed-off-by: guolongji <guolongji@uniontech.com>
> ---

Why is it "not possible"? Do you get syntax errors? Are the logic and the 
result of the function altered? If not, control is certainly "possible".

Remember that something may be unnecessary and redundant even if 
it is still possible.

Regards,

Fabio


