Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8067B;
	Sat, 11 Mar 2023 13:00:29 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id y11so8370261plg.1;
        Sat, 11 Mar 2023 05:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678539628;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FOVUGLyk0WaH0HGVxdTsj4sDJWFdVCG0i2OruRQuZy4=;
        b=lBo18Duv32tOvx+nbh2n/RSh3L0dKzxDqQkYBTupBedU065pc9W0WWuCXRxP1guQ3T
         ctiH4mgpNascl2fx8RPrfVXvht6YucDoZuMkSmAhLxBj9W/dLeFVvIpLYhoEmQyNcQSI
         xGiBD5V95dTuWHXTlK/klURpgf0QzpjkqQ94UyQrGPvslI+F7nYLXPcFVPa7emuGSgGL
         atLRfgPjQLi3ZAKNLEeEXON2xsswksdJrRFX0DuiL6TELssnqlhdtgi/cWJ6jQkUR6E+
         0lsri7rHBPLtMazWcaTTxnFk35cC4hpWPP6MPXoA5AtX9VWmX2KluaBckh8oLUxDic8X
         PTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678539628;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOVUGLyk0WaH0HGVxdTsj4sDJWFdVCG0i2OruRQuZy4=;
        b=2bgxVj7hWf5VfNj5qOMXVhpQ9X+4l/z22D1B7uF6januTtiFgn8D+54amX+kQeYQa2
         UAPKexVo+WmAcyWhe2VhOcqDdn+WkqYSCX3SKeIs26Z5+uzhmBkh9Yqu3ZKA1evG5do6
         uDo4OnugNrhCvySSFQD03dXRy7NWcfW83x/OgpzerBFYRGciyTOByz20UiooSQaNLGnW
         MVxAFYkN5XmUQMMBLLnPF0H2VY4BAnAzNPaLct+OhlfinusTEhMkl0XdaoAloiYIuSe1
         /q0XqrPjvReWug6s528RV+SkHdBy+FT+acAtetocOBxWjXZI8i64ouJrT49lJ460+Jxt
         ZB7Q==
X-Gm-Message-State: AO0yUKUCSA2qsHZmhKXIjCCj7ypiD0uOf9assmHRAhbMdEWTcQ9d4gVL
	E9UgrvdIQ1NOC8yBJOrShuFm9k7tw5dZAQ==
X-Google-Smtp-Source: AK7set/RMmZN1lZfq/y9ULfiegGNC3IR15eF59I0VUP7iwgwH5keRlqqTJOAa53NZaIokQnmcJoVaw==
X-Received: by 2002:a17:902:8a90:b0:19b:33c0:4097 with SMTP id p16-20020a1709028a9000b0019b33c04097mr25271135plo.27.1678539628305;
        Sat, 11 Mar 2023 05:00:28 -0800 (PST)
Received: from ubuntu ([117.199.152.23])
        by smtp.gmail.com with ESMTPSA id lg3-20020a170902fb8300b0019e56171eacsm1517713plb.198.2023.03.11.05.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 05:00:27 -0800 (PST)
Date: Sat, 11 Mar 2023 05:00:23 -0800
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: error27@gmail.com
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] Staging: pi433: Change bit_rate type from u16 to u32
Message-ID: <20230311130023.GB14247@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9d62635-b968-4dfd-aa10-e34e38a114a5@kili.mountain>

Hi Dan,

The description in TODO is difficult to understand. I would appreciae if
you could help me understand it more in a step-by-step simplified means.

"This configuration needs to be moved to sysfs instead of being done through
+     IOCTL. Goind forward, we need to port userspace tools to use sysfs instead
+     of IOCTL and then we would delete IOCTL." 


