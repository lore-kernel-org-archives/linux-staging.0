Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1223A3C00;
	Thu, 16 Mar 2023 15:09:12 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id o12so8893096edb.9;
        Thu, 16 Mar 2023 08:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678979351;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2quNYX+HRyuvEQ3fh4N1hdxu22NmV7ILP9KErjbF4rw=;
        b=TgSqjm8qtOPoLtnoANBoxGwoDvzwTi623LwQfF1NSttUfbLXjAK8i9vhv081QT7mHh
         yseJJMcYiQvJxdBuLg0zdAvz6lZGQ0+h62Ay3vqu/4FV4wQIXPU2itq4J7rt/a+Cjrc9
         f7SggSO5mV+FAOuz6BCzd2xuNZfz9RjwahzsnpMqQ5/4J7qRQHhp8skiwFR6Sa4iU/kz
         t/Kg6fI9RSchneI+TS8MksRT/YpZ3mH7z225NA8DOv8TviP7mZxYMnkuqTv9Tq9xYXrl
         v8dvsIQ11xzRP+/8bVkEP5BMV2sBHaJMo6PbiDxHZD1yx6NacGdFAVINScpEOcUryOEV
         TbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678979351;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2quNYX+HRyuvEQ3fh4N1hdxu22NmV7ILP9KErjbF4rw=;
        b=0M4nc1iS7LIZLnNThRAY9qzGESLt9Ee2+ECxQlxJ7VbokN26iofMEJ4odTnNJOA2vk
         KAI3pvGB+wov6slx59mLGdio8QppAiBWKl9Oa6VzedEa8BECoEkD+HBd6pgT8YkbVJKu
         WXpspRejyJDhttpZadflQT1YrSn6XXHrQVb8dmrWzhqbQiHzX9g2TFijbjrVBUmY/yeZ
         ac/keICnQLCFAHm9Yo2fpISoYFvSeXezF/nuewPKDUZYgr6waxN28E2mYOFAzqWaV37n
         +/1bdr7hayRafd7hQJDarM9clAFS8VbTO6T1vne7Nww1UpbfqkQhAuuAB3fblQvQA3ZV
         cbNw==
X-Gm-Message-State: AO0yUKUOZPcDWsCDqvnZBsBqT43oEUcSeay0NUvszqHkwEkcSdo9Krn3
	MpBAV3sryI91anL0mu8OiB8=
X-Google-Smtp-Source: AK7set+Xtgb/QWxwdF/t3Xc0VwtnHqsydq8nILUkn5Fl7K2cvpbUN8GoIdTdTcT+Uns4xogT/QG1Yw==
X-Received: by 2002:a17:906:cecb:b0:92f:f2cc:93 with SMTP id si11-20020a170906cecb00b0092ff2cc0093mr4363653ejb.22.1678979351101;
        Thu, 16 Mar 2023 08:09:11 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.209.88])
        by smtp.gmail.com with ESMTPSA id v11-20020a1709062f0b00b00914fec9f40esm3966932eji.71.2023.03.16.08.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 08:09:10 -0700 (PDT)
Date: Thu, 16 Mar 2023 20:09:08 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] staging: axis-fifo: initialize timeouts in probe only
Message-ID: <ZBMxFLtW2ekCvm/s@khadija-virtual-machine>
References: <ZBMR4s8xyHGqMm72@khadija-virtual-machine>
 <2626731.BddDVKsqQX@suse>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2626731.BddDVKsqQX@suse>

On Thu, Mar 16, 2023 at 03:38:03PM +0100, Fabio M. De Francesco wrote:
> Khadija,
>
> Just saw your v5 patch and Greg's two replies.
> 
> For v6 you will need to change the subject to "[PATCH v6] staging: axis-fifo: 
> initialize timeouts in init only" to indicate that you are doing assignments 
> in axis_fifo_init().
> 
> Don't forget to extend the version log with "Changes in v6:" and clarify that 
> v5 had a different "Object" (you should probably also add a link to the v5 
> patch in lore: https://lore.kernel.org/lkml /ZBMR4s8xyHGqMm72@khadija-virtual-
> machine/). When the "Subject" changes, readers may not find the previous 
> versions easily.    
>
> On giovedì 16 marzo 2023 13:56:02 CET Khadija Kamran wrote:
> > Module parameter, read_timeout, can only be set at the loading time. As
> > it can only be modified once, initialize read_timeout once in the probe
> 
> Substitute "probe" with "init".
> 
> > function.
> > 
> > As a result, only use read_timeout as the last argument in
> > wait_event_interruptible_timeout() call.
> 
> This two sentences are not much clear. I'd merge and rework:
> 
> "Initialize the module parameters read_timeout and write_timeout once in 
> init().
> 
> Module parameters can only be set once and cannot be modified later, so we 
> don't need to evaluate them again when passing the parameters to  
> wait_event_interruptible_timeout()."   
> 
> > 
> > Convert datatpe
> 
> s/datatpe/type/
> 
> > of read_timeout
> 
> of {read,write}_timeout
> 
> > from 'int' to 'long int' because
> > implicit conversion of 'long int' to 'int' in statement 'read_timeout =
> > MAX_SCHEDULE_TIMEOUT' results in an overflow warning.
> 
> We don't care too much about the warning themselves: I mean, it overflows and 
> you must avoid it to happen (as you are doing with the changes of types), not 
> merely be interested in avoiding the warning. "[] results in an overflow." is 
> all we care about.
>

Hey Fabio!
Thank you for your feedback. I have undertood it and will make sure to
send them in the next PATCH v6.

> Add also the previous paragraph in the last part of the commit message.
>  
> > Perform same steps formodule parameter, write_timeout.
> 
> And instead delete the this last phrase.
> 

Can you please explain the above feedback. I am confused. What should I
use instead of this last phrase?

> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > ---
> > 
> > Changes in v5:
> >  - Convert timeout's datatype from int to long.
> > Changes in v4:
> >  - Initialize timeouts once as suggested by Greg; this automatically
> >    fixes the indentation problems.
> >  - Change the subject and description.
> > Changes in v3:
> >  - Fix grammatical mistakes
> >  - Do not change the second argument's indentation in split lines
> > Changes in v2:
> >  - Instead of matching alignment to open parenthesis, align second and
> >    the last argument instead.
> >  - Change the subject to 'remove tabs to align arguments'.
> >  - Use imperative language in subject and description
> > 
> >  drivers/staging/axis-fifo/axis-fifo.c | 26 ++++++++++++++++----------
> >  1 file changed, 16 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/staging/axis-fifo/axis-fifo.c
> > b/drivers/staging/axis-fifo/axis-fifo.c index dfd2b357f484..d667dc80df47
> > 100644
> > --- a/drivers/staging/axis-fifo/axis-fifo.c
> > +++ b/drivers/staging/axis-fifo/axis-fifo.c
> > @@ -103,17 +103,17 @@
> >   *           globals
> >   * ----------------------------
> >   */
> > -static int read_timeout = 1000; /* ms to wait before read() times out */
> > -static int write_timeout = 1000; /* ms to wait before write() times out */
> > +static long read_timeout = 1000; /* ms to wait before read() times out */
> > +static long write_timeout = 1000; /* ms to wait before write() times out */
> > 
> >  /* ----------------------------
> >   * module command-line arguments
> >   * ----------------------------
> >   */
> > 
> > -module_param(read_timeout, int, 0444);
> > +module_param(read_timeout, long, 0444);
> >  MODULE_PARM_DESC(read_timeout, "ms to wait before blocking read() timing 
> out;
> > set to -1 for no timeout"); -module_param(write_timeout, int, 0444);
> > +module_param(write_timeout, long, 0444);
> >  MODULE_PARM_DESC(write_timeout, "ms to wait before blocking write() timing
> > out; set to -1 for no timeout");
> > 
> >  /* ----------------------------
> > @@ -384,9 +384,7 @@ static ssize_t axis_fifo_read(struct file *f, char 
> __user
> > *buf, mutex_lock(&fifo->read_lock);
> >  		ret = wait_event_interruptible_timeout(fifo->read_queue,
> >  			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
> > -				 (read_timeout >= 0) ?
> > -				  msecs_to_jiffies(read_timeout) :
> > -				  MAX_SCHEDULE_TIMEOUT);
> > +			read_timeout);
> > 
> >  		if (ret <= 0) {
> >  			if (ret == 0) {
> > @@ -528,9 +526,7 @@ static ssize_t axis_fifo_write(struct file *f, const 
> char
> > __user *buf, ret = wait_event_interruptible_timeout(fifo->write_queue,
> >  			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
> > 
> >  				 >= words_to_write,
> 
> What is this? You haven't yet compiled your patch.
> Any further problems with enabling axis-fifo as a module?
>


Sorry, my bad.  Instead of fixing the menuconfig I used this command to
remove the warnings: 
make -j"$(nproc)" ARCH=arm64 LLVM=1 drivers/staging/axis-fifo/
I thought it is compiling my module correctly.
But I am working on your feedback. And before sending my next patch I
will make sure to compile it properly.


> Fabio
> 
> > 
> > -				 (write_timeout >= 0) ?
> > -				  msecs_to_jiffies(write_timeout) :
> > -				  MAX_SCHEDULE_TIMEOUT);
> > +			write_timeout);
> > 
> >  		if (ret <= 0) {
> >  			if (ret == 0) {
> > @@ -815,6 +811,16 @@ static int axis_fifo_probe(struct platform_device 
> *pdev)
> >  	char *device_name;
> >  	int rc = 0; /* error return value */
> > 
> > +	if (read_timeout >= 0)
> > +		read_timeout = msecs_to_jiffies(read_timeout);
> > +	else
> > +		read_timeout = MAX_SCHEDULE_TIMEOUT;
> > +
> > +	if (write_timeout >= 0)
> > +		write_timeout = msecs_to_jiffies(write_timeout);
> > +	else
> > +		write_timeout = MAX_SCHEDULE_TIMEOUT;
> > +
> >  	/* ----------------------------
> >  	 *     init wrapper device
> >  	 * ----------------------------
> > --
> > 2.34.1
> 
> 
> 
> 
