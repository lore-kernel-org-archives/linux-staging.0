Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5941117
	for <linux-staging@lists.linux.dev>; Sun, 14 May 2023 13:01:59 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-64a9335a8e7so14754297b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 14 May 2023 06:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684069319; x=1686661319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgGnPOVW+jIsBNOHMq2yRd/iIdLAkqP/raisUJk9qEQ=;
        b=lSt9/Of52sobaJ4kW8BwXFt31M/MuJK76UXNagH/cMZa2zj5j1VqOGYzIHqDGtNj5S
         mhAj4KueMtZhkUCAjmGBVrUXNSHnrAKfODgZ3S5Ri0yl76T3c/WjlQMLJhbjYjdq+VZn
         yKr9rG0ybDgZHmljrI/3IybjdzNKoxSuGqmBHNXR+RlYTZ4TkXKyO6fk+2NyJtULNaWw
         6/f+35n31rUU6AmAz13lO/yM0hV1bm29dXzl+WF4+2GvMCiLDgH0uuq+iacF/Tkvqu9G
         qb46exrV0Uiem5J4tB3RdHSQdF3279LCGmnlIFC0O/qBSX+voZ/f0KH/v1WuX53b9ys7
         7i2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684069319; x=1686661319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgGnPOVW+jIsBNOHMq2yRd/iIdLAkqP/raisUJk9qEQ=;
        b=ZkoYJ+v0QPH6bp3gScZ3+w/9rGe1F7NxauTUfnvYfl9+PwWM0nqC98CjuNR8Vvx2rD
         kcKC9wVRkxSt3oZhs0CxhXKbpMAwqUQbyFvYsJoefFpVeiCJ+XduBWAMd6FOskqqHkon
         aSTcZ2rdKP7HRYzREfNlJXbWYe9bqQG5Yy930oaiU7LSZyeANdHg+4/7pGbGTCNYLS5h
         7Nru/RnM1u1a2ph6ZRcbzLZgeRbP9lSVDrzS0uV2D3WcoAHloPgNrhaoFonmy3ctQUm3
         T2LGxyb+WjdbaTgTD7MTOVB9vkZaAKAYcskuYPvGYIW43G594gRfMKu3wj7OBnATFDIw
         eoPA==
X-Gm-Message-State: AC+VfDxVYP2KpL1XNUykwF5hFalxR5uZfjC6vrNlq61auP2fnwgU24v0
	6H+OVaEGyHP/5W+wYu5SC8g=
X-Google-Smtp-Source: ACHHUZ5AUNj5aZ7begBx5i9E4Wz/GAkEhaP86c5SG9oj5ml4uKJdnEUFfknzHW94a+QHBo56gCI0Xw==
X-Received: by 2002:a05:6a20:2452:b0:104:f9d4:1413 with SMTP id t18-20020a056a20245200b00104f9d41413mr5890307pzc.5.1684069319382;
        Sun, 14 May 2023 06:01:59 -0700 (PDT)
Received: from redkillpc.. ([49.207.202.99])
        by smtp.gmail.com with ESMTPSA id e35-20020a635463000000b0051b70c8d446sm9766146pgm.73.2023.05.14.06.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 06:01:58 -0700 (PDT)
From: Prathu Baronia <prathubaronia2011@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	prathubaronia2011@gmail.com
Subject: 
Date: Sun, 14 May 2023 18:31:46 +0530
Message-Id: <20230514130148.138624-1-prathubaronia2011@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2023051411-happier-mural-a8ef@gregkh>
References: <2023051411-happier-mural-a8ef@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the feedback. I have gone through
Documentation/process/submitting_patches.rst and have split v1 into
logical commits and added appropriate commit messages. Please let me
know if there any changes required in this.

Prathu


