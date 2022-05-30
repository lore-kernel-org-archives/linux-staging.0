Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FE717E8
	for <linux-staging@lists.linux.dev>; Mon, 30 May 2022 07:40:20 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id w27so5689572edl.7
        for <linux-staging@lists.linux.dev>; Mon, 30 May 2022 00:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to;
        bh=3ie7fxZ/7i068+0rOaIZdjZ18uClBhAfOUmO9sbKKqg=;
        b=nH39KqqxBYB1IvGVPmLjKFw9JNDUaDBGc9vtWNfNN89+Sx20MGCkgDeLH3CjTtzkyx
         xYmWUENbzgUAwpyazDZ445wJBfnZZR5OcUTikLQ34zTttCpSrOKW2yKQnjuSB2Wgsc4s
         0z0tQqPfTgzSSIFJPrmna8bdKBp/9KRXmbLqrfCRGt67KUOxICmrcKRnFZmadFv9qjBK
         2oJ2ZpvDnoUSo5utVxdX+SuQjSCXLDW5/68v0TiaWrxM+AGhLulO8ZK3DJKltBH8urM5
         11FjDEYv8zx2VUjGavUjEsEXePtr+8cdIkc87vcK2M4p2UzggFwKjrJusemjJw2MNMC7
         5Q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to;
        bh=3ie7fxZ/7i068+0rOaIZdjZ18uClBhAfOUmO9sbKKqg=;
        b=7VkrDUfEBN+seArb3jW4iwI5uXyXOlpmp/O1dm2IWGOkCY0fDnh1p8NS4gwKe8dlUz
         x7uMxdQhoQ+FNeaJl3x0wd1Com4KMi+tELImRRBTsruChVNe8NOY7BgtngsqitQPwr7m
         4j/4YQHe6XqMIATye9f0atdFTAKm8ozkulu/uvbTPskUrHXWPkaYB71v3lq52P+0C/cx
         cV2rwH8hPcmCrfXIKln8Ea1bbqdnc9JqD48WY3peDBegQdSUwARpolwo4A9nR2YScKqn
         kg6h677J9DrHIoMub8TsUXiK7fud2VehF0ITJ3XHSUtI+esDyXQu/k54kQxsBbsamzll
         vALQ==
X-Gm-Message-State: AOAM530tfJ8/eLRcW4xC9BcOZgIYUirqxKnFpyCsU9OIzhMeC6guz7HN
	XzqNafG+xYsRdYvwB1KKx8c=
X-Google-Smtp-Source: ABdhPJy39Fq/URijgituE1hHV8Rc2qHJ5gD7L0+5lWtaa4aiRuv3zVRgTLpY1WvO6IoSHTyi22bk/Q==
X-Received: by 2002:a05:6402:34d4:b0:42b:35e5:fc78 with SMTP id w20-20020a05640234d400b0042b35e5fc78mr47098275edc.372.1653896418639;
        Mon, 30 May 2022 00:40:18 -0700 (PDT)
Received: from nam-dell ([2a02:8109:afbf:ed88:b5c4:5fcb:73aa:5762])
        by smtp.gmail.com with ESMTPSA id o18-20020a50c292000000b0042bc54296a1sm6023025edf.91.2022.05.30.00.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 00:40:18 -0700 (PDT)
Date: Mon, 30 May 2022 09:40:17 +0200
From: Nam Cao <namcaov@gmail.com>
To: dan.carpenter@oracle.com
Cc: forest@alittletooquiet.net, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	namcaov@gmail.com
Subject: Re: [PATCH] staging: vt6655: remove unnecessary type cast
Message-ID: <20220530074017.GA15684@nam-dell>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220530073341.GK2146@kadam>

Yes, this patch is a mistake. I clarified that but I think my email
got blocked because it's html.

Sorry for wasting your time.

Best regards,
Nam
