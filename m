Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C307F
	for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 07:27:57 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id t10so16074516edd.12
        for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 00:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679729276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rl1PuHlEkrI0wqx6ZTM2HfHVZPCcP/xvjlX781kpYaw=;
        b=g6jl5PILobZbrpLZeaCrQQYPWhMUNkxCGxE2uRQTxMSJlrAFnk8eJju+aFCM/bC1p9
         smzFx7ox8xobLoNIb9bE45odI56shl4P4BZAb//4EviF9kfqsNB/Yuu6Xdy5G2HpRfX1
         Xz89MZJXHVu4f18kGfIgoFol5h00byvDhfunGQhXPVspihmwH8udlXO3ksXhIgYHBz1n
         ji6AIrGPk4B5ZRwhndvSaJjSHqUBgM1XJDIRButWorFaj3AmupsU387YKo+OEyEQaxrF
         nnEy/rkGkZndoo8emE3kAGnl9Vcxuot5Apovd+I4mj47nBm8TGfDtWXCfeihu4sEreIJ
         gC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679729276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rl1PuHlEkrI0wqx6ZTM2HfHVZPCcP/xvjlX781kpYaw=;
        b=xH3kdqA4ArSWXAAoBhk4bk8j5Vpne3Itz6h+r2YfDIX+arvc+Nz6UuZ73QEbTOv/Ey
         zeNvZVW3q/TeNHS0jtgnLDeYLyKA++TlmPKK62NRL/W48tuFzJRAMJQlghMUgcghyP/E
         qWFwtmbbpmxk231d9JpTCaPFwUfwbVfj7gJAAYyAG4ul1wTPknu8T6JPQuKJBUG02B9Y
         hHkP2wRbLiLAapSrOBbTA2BQiShGefPSn+hFgMqpLqf9PsXmpTh9bZmTHfEtKbdgKZD+
         hB/tdtDodQWGq1/GmZJmum90l3AYn2NRtBGwheHtW+CVI8/XHzMQigkJLsSrzuZxk8Ys
         a5qA==
X-Gm-Message-State: AAQBX9eZ7XZNeMgbi+1ApKbr4hzByrzF+1iWiUkT8+2NSXXvJJB/nPT4
	fQgI6a55H+TbtviZtzxK7WA=
X-Google-Smtp-Source: AKy350azekAWDgK8X/LXuBdtAzvVG5JhxS2oIcG2tqcQbqiJbRlqdIlfLiNl2TzKIPuHGQHzGakiRg==
X-Received: by 2002:a17:907:a64a:b0:92e:e9c2:7b9c with SMTP id vu10-20020a170907a64a00b0092ee9c27b9cmr6299333ejc.77.1679729275893;
        Sat, 25 Mar 2023 00:27:55 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id hy16-20020a1709068a7000b00931d3509af1sm11296338ejc.222.2023.03.25.00.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 00:27:55 -0700 (PDT)
Date: Sat, 25 Mar 2023 10:27:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: Dalvin-Ehinoma Noah Aiguobas <pharcodra@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH]: staging: wlan-ng: Remove unnecessary Parentheses
Message-ID: <addce339-7653-405b-8d1d-ef29da74a8f3@kili.mountain>
References: <20230325002225.GA109622@koolguy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230325002225.GA109622@koolguy>

The subject has an extra : after the "[PATCH]:".

On Sat, Mar 25, 2023 at 01:22:25AM +0100, Dalvin-Ehinoma Noah Aiguobas wrote:
> Clean up Checkpatch issues by removing unnecessary Parentheses.
> 

Just ignore checkpatch on this.  Greg likes parentheses.

> @@ -478,7 +478,7 @@ static int prism2_connect(struct wiphy *wiphy, struct net_device *dev,
>  
>  			result = prism2_domibset_uint32(wlandev,
>  							DIDMIB_DOT11SMT_PRIVACYTABLE_WEPDEFAULTKEYID,
> -				sme->key_idx);
> +							sme->key_idx);

Don't mix unrelated changes into the patch.

regards,
dan carpenter

