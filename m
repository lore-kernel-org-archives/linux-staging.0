Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FB62FAD
	for <linux-staging@lists.linux.dev>; Fri, 13 Aug 2021 21:55:17 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id q3so13333792edt.5
        for <linux-staging@lists.linux.dev>; Fri, 13 Aug 2021 14:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P+Z/RYz/jriuijQpIN7Fhw40kHDI4JM4DRM0zPmZRTY=;
        b=VeuSfTAea9nDlLQ8zYxcK0qWXy7SzRkRFt2hjrCQ7JiEf75tgQcKWHrOxgS55Bonle
         8sk6K+9xXJQWVdPdbjQxXz/IU0eJ1/BpZk9xHSB8IVXeDM6dT+HUMQ/R9kMHo+mCmJbg
         T7LtrpDnbZnCYtyOwdOpJ1tzKxdU+8Sl+fDp+RZ3t5ifybxVLDw31ntMRlFZhzKUWFyN
         QpXnFHtOT8XRIHF9tbdkC/1Zn5+aiZFduh0q9ALxbhv6maAdysYKJhvjMBZROUx4xGUB
         N3RN77TH+NophsNw66AobC+cM49E1NfcjWZSo7CdwMajsUYfhd377RY/x4hHyM46Cn9Y
         nU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P+Z/RYz/jriuijQpIN7Fhw40kHDI4JM4DRM0zPmZRTY=;
        b=foT62gN78ucDLhDdp3PUpmNR/hvEfgW/vfBwhj83QzBqfIpnRKlR67DBWNEv8ttVV+
         MCUUidFMnJD2PSryEc2m/zzfaw/513EcgtOCFDEWn911UTkKFUT1U17R7b4+0t24C3zb
         V04P9BMigr/vLbu1khk2QbPtLwJmpc/4JeLdehxULsHfOHQnm1McyqL4drexk1ihuCrN
         A50pzfaY3k47x9YRIoFjxGZfY5tv8oJ6jRQriG5+vR7gVcW1qftkSmHy7h459z1wYV8H
         QDbsxf8QhB2wn3ShpEfdnO7m1zsyoOzpMc2ZpPrt24ULl+8XiCCdi8AZpzhxsk+WIXHu
         VqmA==
X-Gm-Message-State: AOAM533E867rsqGbkFpbI86wIMoNB1L5BMRUrbRDjPpFcS9/Jw4Q4KPs
	jArjKruZ82jbcgmGBVnX/8M=
X-Google-Smtp-Source: ABdhPJzHbUlQQIzzv3T9J80QbmMZRWzFGGEswNHk4x46iK0pDa74tVImS72KHHsj8knXm/3+OXVXmg==
X-Received: by 2002:a50:aa87:: with SMTP id q7mr2807690edc.157.1628891716371;
        Fri, 13 Aug 2021 14:55:16 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id dg24sm1442864edb.6.2021.08.13.14.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 14:55:15 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Phillip Potter <phil@philpotter.co.uk>, Larry Finger <Larry.Finger@lwfinger.net>, Nathan Chancellor <nathan@kernel.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: Remove unnecessary ret variable in rtw_drv_init()
Date: Fri, 13 Aug 2021 23:55:14 +0200
Message-ID: <5820125.tyerhIWj94@localhost.localdomain>
In-Reply-To: <20210813201418.4018631-1-nathan@kernel.org>
References: <20210813201418.4018631-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, August 13, 2021 10:14:18 PM CEST Nathan Chancellor wrote:
> ret is unnecessary as both error paths set the same error code so just
> return that directly.
> 
> Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Much nicer!

Reviewed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Thanks,

Fabio


